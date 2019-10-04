class MusicLibraryController
  attr_reader :path
  
  def initialize(path = "./db/mp3s")
    @path = path
    
    music_importer = MusicImporter.new(path)
    
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
    
    ask = ""
    
    until ask == "exit" do 
      ask = gets
      
      if ask == "exit"
        
      elsif ask == "list songs"
        list_songs
      elsif ask == "list artists"
        list_artists
      elsif ask == "list genres"
        list_genres
      elsif ask == "list artist"
        list_songs_by_artist
      elsif ask == "list genre"
        list_songs_by_genre
      elsif ask == "play song"
        play_song
      end
    end 
  end
  
  def list_songs
    alphabetized = Song.all.sort { |song1, song2| song1.name <=> song2.name }
      alphabetized = alphabetized.uniq
    
    alphabetized.each_with_index do |song, index| 
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end 
  end
  
  def list_artists
    alphabetized = Artist.all.sort { |artist1, artist2| artist1.name <=> artist2.name }
    
    alphabetized.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end 
  
  def list_genres
    alphabetized = Genre.all.sort { |genre1, genre2| genre1.name <=> genre2.name }
    
    alphabetized.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end 
  
  def list_songs_by_artist()
    puts "Please enter the name of an artist:"
    artist_name = gets
    artist = Artist.find_or_create_by_name(artist_name)
    
    songs = artist.songs.sort { |song1, song2| song1.name <=> song2.name }
    
    songs.each_with_index do |song, index| 
      puts "#{index+1}. #{song.name} - #{song.genre.name}"
    end 
  end
  
  def list_songs_by_genre()
    puts "Please enter the name of a genre:"
    genre_name = gets
    genre = Genre.find_or_create_by_name(genre_name)
    
    songs = genre.songs.sort { |song1, song2| song1.name <=> song2.name }
    
    songs.each_with_index do |song, index| 
      puts "#{index+1}. #{song.artist.name} - #{song.name}"
    end 
  end
  
  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.to_i
    
    if 1 <= song_number && song_number <= Song.all.uniq.length
      alphabetized = Song.all.sort { |song1, song2| song1.name <=> song2.name }
      alphabetized = alphabetized.uniq
    
      song = alphabetized[song_number-1]
    
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end