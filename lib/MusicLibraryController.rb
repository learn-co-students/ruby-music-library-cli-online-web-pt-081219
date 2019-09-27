class MusicLibraryController 
  
  attr_accessor :path
  def initialize(path ='./db/mp3s' ) 
    @path = path 
   music_importer = MusicImporter.new(@path)
   music_importer.import
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
  
    loop do 
      user_input = gets.strip 
      break if user_input == "exit"
      
      case user_input 
        when "list songs"
          list_songs
        when "list artists" 
          list_artists 
        when "list genres" 
          list_genres  
        when "list artist" 
          list_songs_by_artist
        when "list genre" 
          list_songs_by_genre
        when "play song"
          play_song
      end
      
    end
    
  end
  
  def list_songs  
    array = Song.all.sort_by{|song| song.name} 
     array.each { |song| puts "#{array.index(song) + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" } 
     array
  end 
  
  def list_artists 
    array = Artist.all.sort_by{|artist| artist.name} 
    array.each{|artist| puts "#{array.index(artist) + 1}. #{artist.name}"}
    array
  end 
  
  def list_genres 
    array = Genre.all.sort_by{|genre| genre.name}
    array.each{|genre| puts "#{array.index(genre) + 1}. #{genre.name}"}
  end
  
  def list_songs_by_artist
     puts "Please enter the name of an artist:"
    artist_name = gets.strip 
    artist = Artist.find_by_name(artist_name)
    
    if artist != nil 
     array= artist.songs.sort_by{|song| song.name}
     array.each{|song| puts "#{array.index(song) + 1 }. #{song.name} - #{song.genre.name}"}
    end
    
  end
  
  def list_songs_by_genre 
    puts "Please enter the name of a genre:"
    genre_research = gets.strip  
    genre = Genre.find_by_name(genre_research) 
    
    if genre != nil 
      array = genre.songs.sort_by{|song| song.name}  
      array.each{|song| puts "#{array.index(song) + 1}. #{song.artist.name} - #{song.name}"}
    end 
    
  end
  
  
  def play_song 
    puts "Which song number would you like to play?"
      my_song = gets.strip 
      
       if is_valid?(my_song) 
        array = Song.all.sort_by{|song| song.name} 
        puts "Playing #{array[my_song.to_i - 1].name} by #{array[my_song.to_i - 1].artist.name}"
       end
  end
  
  def is_valid?(my_song) 
    true if Integer(my_song) && my_song.to_i <= Song.all.size && my_song.to_i >= 1 rescue false 
  end 
  
  
  
end