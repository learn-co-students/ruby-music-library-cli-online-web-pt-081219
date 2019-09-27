class MusicLibraryController
  extend Concerns::Findable 
  
  attr_accessor :path 
  
  def initialize(path = './db/mp3s')
   @path = path 
   music = MusicImporter.new(path)
   music.import 
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
    
    response = gets.chomp  
    until response == "exit"
      response = gets.chomp
    end 
  end 
  
  def list_songs
    Song.all.uniq.sort {|a, b| a.name <=> b.name}.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end 
  end 
  
  def list_artists
    Artist.all.uniq.sort {|a, b| a.name <=> b.name}.each_with_index do |artist, i|
      puts "#{i+1}. #{artist.name}"
    end 
  end 
  
  def list_genres
    Genre.all.uniq.sort {|a, b| a.name <=> b.name}.each_with_index do |genre, i|
      puts "#{i+1}. #{genre.name}"
    end 
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp 
    Artist.all.each do |artist|
      if artist.name == input  
        artist.songs.sort {|a, b| a.name <=> b.name}.each_with_index do |song, i|
          puts "#{i+1}. #{song.name} - #{song.genre.name}"  
        end 
      end 
    end 
  end 
  
  
  def list_songs_by_genre 
    puts "Please enter the name of a genre:"
    input = gets.chomp 
    Genre.all.each do |genre|
      if genre.name == input  
        genre.songs.sort {|a, b| a.name <=> b.name}.each_with_index do |song, i|
          puts "#{i+1}. #{song.artist.name} - #{song.name}"  
        end 
      end 
    end 
  end 
  
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i  
    sorted_song_array = Song.all.uniq.sort {|a, b| a.name <=> b.name}
    song = sorted_song_array[input-1]
    
    if Song.all.include?(song) && input <= Song.all.length && input >0 
      puts "Playing #{song.name} by #{song.artist.name}"
    end 
  end 
    
end 


