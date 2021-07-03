require_relative 'concerns/findable.rb'

class Artist 
  
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name) 
    @name = name
    save 
    @songs = []
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
     Artist.new(name)
  end 
  
  def add_song(song)
    self.songs << song if self.songs.none?(song) 
    
    song.artist = self if !song.artist 
  end 
  
  def genres 
    self.songs.map {|song| song.genre}.uniq 
  end 
  
end 