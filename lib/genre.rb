require_relative "../config/environment"
class Genre 
  @@all = []
  attr_accessor :name, :songs
   extend Concerns::Class_methods
      extend Concerns::Findable
  include Concerns::Instance_methods
  
  def initialize(name)
    @name = name 
    @songs = [] 
  
    @@all << self
   
  end 
  
  def self.all 
    @@all 
  end 
  
  def artists 
    Song.all.collect{|song|  song.artist if song.genre == self}.uniq
    
  end
end