require_relative 'concerns/findable.rb'

class Genre 
  
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
     Genre.new(name)
  end 
  
  def artists
    self.songs.map{|song| song.artist}.uniq 
  end 
  
end 