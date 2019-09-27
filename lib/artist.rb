require "pry"

class Artist  
  
  extend Concerns::Findable 
  
  attr_accessor :name 
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = [] 
  end 

  def save
    @@all << self 
  end 
  
  def self.all
    @@all 
  end 
  
  def self.destroy_all
    self.all.clear 
  end 

  def self.create(name) 
    artist = self.new(name) 
    artist.save 
    artist 
  end 
  
  def add_song(song)
    if song.artist == nil 
      song.artist = self 
    end 
    unless self.songs.include?(song)
      @songs << song
    end 
  end 
  
  def songs 
    @songs 
  end 
  
  def genres 
    @genres = []
    songs.each do |song|
      if !@genres.include?(song.genre)
        @genres << song.genre 
      end
    end 
    @genres 
  end 

end 


