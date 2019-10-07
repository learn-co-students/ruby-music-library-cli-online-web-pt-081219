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
  
end