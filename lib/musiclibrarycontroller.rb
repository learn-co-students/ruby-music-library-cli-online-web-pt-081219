class MusicLibraryController 
  
  attr_reader :path, :imp
  
  def initialize(path = './db/mp3s')
    @path = path 
    imp = MusicImporter.new(path)
    imp.import
  end 
  
  def call
    puts("Welcome to your music library!")
    puts("To list all of your songs, enter 'list songs'.")
    puts("To list all of the artists in your library, enter 'list artists'.")
    puts("To list all of the genres in your library, enter 'list genres'.")
    puts("To list all of the songs by a particular artist, enter 'list artist'.")
    puts("To list all of the songs of a particular genre, enter 'list genre'.")
    puts("To play a song, enter 'play song'.")
    puts("To quit, type 'exit'.")
    puts("What would you like to do?")
    input = ""
    while input != 'exit'
      input = gets.strip
      if input == 'list songs'
        list_songs
      elsif input == 'list artists'
        list_artists 
      elsif input == 'list genres'
        list_genres
      elsif input == 'list artist'
        list_songs_by_artist
      elsif input == 'list genre'
        list_songs_by_genre
      elsif input == 'play song'
        play_song
      end 
    end 
  end 

  def list_songs
    sorted_list = Song.all.sort_by {|song| song.name}
    sorted_list.each_with_index {|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end 
  
  def list_artists
    i = 1 
    list = Artist.all.sort_by {|artist| artist.name}
    list.each do 
      |artist| puts "#{i}. #{artist.name}"
      i+=1 
    end 
  end 
  
  def list_genres
    i = 1 
    list = Genre.all.sort_by {|genre| genre.name}
    list.each do 
      |genre| puts "#{i}. #{genre.name}"
      i+=1 
    end 
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip 
    # binding.pry
    if artist_name 
      songs = Song.all.select {|song| song.artist.name == artist_name}
      sorted_songs = songs.sort_by {|song| song.name} 
      sorted_songs.each_with_index {|song, i| puts "#{i+1}. #{song.name} - #{song.genre.name}"}
    end 
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip 
    if genre_name 
      songs = Song.all.select {|song| song.genre.name == genre_name} 
      sorted_songs = songs.sort_by {|song| song.name} 
      sorted_songs.each_with_index {|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name}"}
    end 
  end 
  
  def play_song
    puts "Which song number would you like to play?" 
    num = gets.strip.to_i
    index = num - 1
    if index > 0 && index < (Song.all.length - 1)
      # binding.pry 
      songs = Song.all.sort_by {|song| song.name}
      song = songs[index]
      puts "Playing #{song.name} by #{song.artist.name}"
      
    end 
    
  end 


  
end 