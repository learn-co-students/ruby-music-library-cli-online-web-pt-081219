require_relative './concerns/findable.rb'

class Genre
  
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  @@all = [] 
  
  def initialize(name)
    @name = name 
    @@all << self
    @songs = []
    
  end 
  
  def self.all
    @@all 
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save 
    @@all << self 
  end

  def self.create(name)
    song = Genre.new(name)
    song
  end
  
  def artists
   artist_list = []
   Song.all.map do |song|
     if song.genre == self && !artist_list.any?(song.artist) 
       artist_list << song.artist
     end
    end
    artist_list
  end

  
end