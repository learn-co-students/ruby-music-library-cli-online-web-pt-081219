require 'pry'

class Artist 
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name) 
    @name = name 
    @songs = []
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all 
    @@all = []
  end 
  
  def save 
    @@all << self 
  end   
  
  def self.create(name)
    new = Artist.new(name)
    new.save 
    new
  end   
  
  def songs 
    @songs
  end 
  
  def add_song(song)
    if song.artist == nil
      song.artist = self 
    end 
    songs << song unless songs.include?(song)   
    # binding.pry
  end 
  
  def genres 
    @genres = songs.map{|song| song.genre}
    # binding.pry
    @genres.uniq
  end  
  
end 