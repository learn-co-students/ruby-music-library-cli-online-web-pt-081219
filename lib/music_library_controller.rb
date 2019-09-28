#binding.pry

class MusicLibraryController
  attr_reader :path
  
  def initialize(path = './db/mp3s')
    @path = path
    new_importer = MusicImporter.new(@path)
    new_importer.import
    #binding.pry
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    user_input = gets.chomp
    
    while user_input != "exit"
      case user_input
        when 'list songs'
          list_songs
        when 'list artists'
          list_artists
        when 'list genres'
          list_genres
        when 'list artist'
          list_songs_by_artist
        when 'list genre'
          list_songs_by_genre
        when 'play song'
          play_song
      end
      
      puts "What would you like to do?"
      user_input = gets.chomp
    end
  end
  
  def list_songs

    array = Song.all.map do |song|
      [song.artist.name, song.name, song.genre.name]
    end
    
    sorted_array = array.sort_by{|s| s[1]}
    
    final_array = sorted_array.map{|s| s.join(" - ")}
    
    final_array.each_with_index do |s, i|
      puts "#{i + 1}. #{s}"
    end
  end
  
  def list_artists
    artist_array = Artist.all.map{|a| a.name}
    
    artist_array.sort.each_with_index do |a, i|
      puts "#{i + 1}. #{a}"
    end
  end
  
  def list_genres
    genres_array = Genre.all.map{|g| g.name}
    
    genres_array.sort.each_with_index do |g, i|
      puts "#{i + 1}. #{g}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input_artist = gets.chomp
    
    if Artist.find_by_name(input_artist)
      selected_artist = Artist.find_by_name(input_artist)
      selected_songs = selected_artist.songs
      sorted_songs = selected_songs.sort_by{|s| s.name}
      
      sorted_songs.each_with_index do |song, i|
        puts "#{i + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    
    if Genre.find_by_name(user_input)
      selected_genre = Genre.find_by_name(user_input)
      selected_songs = selected_genre.songs
      sorted_songs = selected_songs.sort_by{|s| s.name}
      
      sorted_songs.each_with_index do |song, i|
        puts "#{i + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.chomp.to_i - 1
    
    if user_input.to_i.between?(0, Song.all.length - 1)
      sorted_song = Song.all.sort_by{|s| s.name}
      selected_song = sorted_song[user_input]
      puts "Playing #{selected_song.name} by #{selected_song.artist.name}"
    end
  end
end