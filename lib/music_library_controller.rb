require 'pry'

class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = nil
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    until input == "exit"
      input = gets.strip
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
    output = Song.all.each {|song| song}
    output = output.uniq.sort_by {|song| song.name} 
    output.each_with_index{|item, index| puts "#{index + 1}. #{item.artist.name} - #{item.name} - #{item.genre.name}"}
  end
  
  def list_artists
    output = Artist.all.map {|item| item.name}
    output = output.uniq.sort
    output.each_with_index{|item, index| puts "#{index + 1}. #{item}"}
  end
  
   def list_genres
    output = Genre.all.map {|item| item.name}
    output = output.uniq.sort
    output.each_with_index{|item, index| puts "#{index + 1}. #{item}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    song_list = Song.all.select {|song| song.artist.name == input}
    song_list = song_list.uniq.sort_by {|song| song.name}
    song_list.each_with_index{|item, index| puts "#{index + 1}. #{item.name} - #{item.genre.name}"}
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    song_list = Song.all.select {|song| song.genre.name == input}
    song_list = song_list.uniq.sort_by {|song| song.name}
    song_list.each_with_index{|item, index| puts "#{index + 1}. #{item.artist.name} - #{item  .name}"}
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input > 0 && input < Song.all.uniq.length
      input -= 1
      output = Song.all.uniq.sort_by! {|song| song.name}
      selection = output[input]
      if selection
        puts "Playing #{selection.name} by #{selection.artist.name}"
      end
    end
  end
  
  
end


