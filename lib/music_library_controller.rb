class MusicLibraryController
  
  attr_accessor :path
  
  def initialize(path = "./db/mp3s")
    @path = path
    music_importer_object = MusicImporter.new(path)
    music_importer_object.import
  end
  
  def call
    input = ""
    until input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets
      
      case input
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "list artist"
        self.list_songs_by_artist
      when "list genre"
        self.list_songs_by_genre
      when "play song"
        self.play_song
      end
    end
  end
  
  def list_songs
    counter = 1
    sorted_list = Song.all.sort_by{|song| song.name}
    sorted_list.each do |song| 
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
    
  end
  
  def list_artists
    counter = 1
    sorted_list = Artist.all.sort_by{|artist| artist.name}
    sorted_list.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
  end
  
  def list_genres
    counter = 1
    sorted_list = Genre.all.sort_by{|genre| genre.name}
    sorted_list.each do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    counter = 1
    if artist = Artist.find_by_name(input)
      artist.songs.sort_by{|song| song.name}.each do |song|
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter += 1
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets
    counter = 1
    if genre = Genre.find_by_name(input)
      genre.songs.sort_by{|song| song.name}.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter += 1
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    song_list = Song.all.sort_by{|song| song.name}
    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = song_list[input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
  
end