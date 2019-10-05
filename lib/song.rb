require 'pry'

class Song 
  attr_accessor :name, :artist, :genre
  @@all = []

  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
  #  @artist = artist 
  
  self.artist = artist if artist

 # @genre = genre 
  self.genre = genre if genre 
  
  end 
  
  def self.all 
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end 
  
  def save
    self.class.all << self 
  end 
  
  def self.create(name)
    song = new(name) 
    song.save  
    song 
  end 

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
 end 
 
 def self.find_by_name(name)
  @@all.find {|song| song.name == name}
end
 
 def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
 end 
 #binding.pry 
  def self.new_from_filename(file)
      file = file.gsub(".mp3","").split(" - ")
      artist = Artist.find_or_create_by_name(file[0])
      genre = Genre.find_or_create_by_name(file[2])
      self.new(file[1], artist, genre)
    end 
  end 
