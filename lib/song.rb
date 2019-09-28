require 'pry'

class Song
  extend Concerns::Findable
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    genre != nil ? self.genre = genre : nil
    artist != nil ? self.artist = artist : nil
  end
  
  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end
  
  #CLASS METHODS
  def self.all
    @@all.uniq
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.new_from_filename(filename)
    filename.slice!(".mp3")
    file_array = filename.split(" - ")
    
    name = file_array[1]
    artist = Artist.find_or_create_by_name(file_array[0])
    genre = Genre.find_or_create_by_name(file_array[2])
    
    new_song = find_or_create_by_name(name)
    new_song.artist = artist
    new_song.genre = genre
    new_song
  end
  
  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    new_song.save
  end
  
  #INSTANCE METHODS
  def save
    @@all << self
  end
  
  def artist
    @artist
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre
    @genre
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
end