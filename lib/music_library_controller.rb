class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end
  
  def call 
    user_input = ""
     
     while user_input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      
    user_input = gets
    
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
    Song.all.sort {|artist_one, artist_two| artist_one.name <=> artist_two.name }.each.with_index(1) do |track, index|
      puts "#{index}. #{track.artist.name} - #{track.name} - #{track.genre.name}"
    end
  end
  
  def list_artists
    Artist.all.sort {|artist_one, artist_two| artist_one.name <=> artist_two.name }.each.with_index(1) do |singer, index|
      puts "#{index}. #{singer.name}"
    end
  end
  
  def list_genres
    Genre.all.sort {|artist_one, artist_two| artist_one.name <=> artist_two.name }.each.with_index(1) do |category, index|
      puts "#{index}. #{category.name}"
    end
  end
  
    def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets
    
    if artist = Artist.find_by_name(user_input)
       artist.songs.sort {|artist_one, artist_two| artist_one.name <=> artist_two.name }.each.with_index(1) do |track, index|
      puts "#{index}. #{track.name} - #{track.genre.name}"
    end 
   end 
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets
    
    if genre = Genre.find_by_name(user_input)
       genre.songs.sort {|artist_one, artist_two| artist_one.name <=> artist_two.name }.each.with_index(1) do |track, index|
      puts "#{index}. #{track.artist.name} - #{track.name}"
    end 
   end 
  end 
  
   def play_song
    puts "Which song number would you like to play?"

    user_input = gets.to_i
    if (1..Song.all.length).include?(user_input)
      song = Song.all.sort {|artist_one, artist_two| artist_one.name <=> artist_two.name }[user_input - 1]
    end
    
  if song 
    puts "Playing #{song.name} by #{song.artist.name}" 
  end
 end
end 