require 'pry'
class Genre 
  extend Concerns::Findable
 attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    save
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
    self.new(name)
  end 
  
  def songs
    @songs
  end
  
  def artists
    artists = songs.collect do |song|
      song.artist
    end
    artists.uniq
  end

end