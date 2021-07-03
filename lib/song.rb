require 'pry'

class Song 
  
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil) 
    self.name = name
    self.artist = artist if artist 
    self.genre = genre if genre 
    save 
  end 
  
  def self.all
    @@all 
  end 
  
  def save 
    @@all << self 
  end
  
  def self.destroy_all 
    self.all.clear 
  end 
  
  def self.create(name)
     Song.new(name)
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self if genre.songs.none?(self)
  end 
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    !find_by_name(name) ? create(name) : find_by_name(name)
  end 
  
  def self.new_from_filename(file)
    artist , name , genre = file.split(" - ")
    genre.gsub!(".mp3", "")
    
    new_artist = Artist.find_or_create_by_name(artist)
    new_genre = Genre.find_or_create_by_name(genre)
    
    Song.new(name ,new_artist, new_genre)
  end 
  
  def self.create_from_filename(file)
    new_from_filename(file)
  end 
  
end 