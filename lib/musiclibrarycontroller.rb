class MusicLibraryController
  attr_reader :path, :music_importer
  def initialize(path = "./db/mp3s")
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end
  
  def call
   while true
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip
      case input
      when "exit"
        break
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
    array = []
    Song.all.sort_by{|song|song.name}.each_with_index{|song,index|
      string = "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      array << song
      puts string
    }
    array
  end
  
  def list_artists
    Artist.all.sort_by{|artist|artist.name}.each_with_index{|artist,index|
      puts "#{index+1}. #{artist.name}"
    }
  end
  
  def list_genres
    Genre.all.sort_by{|genre|genre.name}.each_with_index{|genre,index|
      puts "#{index+1}. #{genre.name}"
    }
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    Artist.find_or_create_by_name(input).songs.sort_by{|song|song.name}.each_with_index{|song,index|
      puts "#{index+1}. #{song.name} - #{song.genre.name}"
    }
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    Genre.find_or_create_by_name(input).songs.sort_by{|song|song.name}.each_with_index{|song,index|
      puts "#{index+1}. #{song.artist.name} - #{song.name}"
    }
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    array = Song.all.sort_by{|song|song.name}
    if input > 0 && input < array.length
      puts "Playing #{array[input-1].name} by #{array[input-1].artist.name}"
    end
  end
end