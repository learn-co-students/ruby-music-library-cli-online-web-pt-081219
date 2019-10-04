class Genre 
  attr_accessor :name, :genre  
  @@all = []
  
  def initialize (name, genre = nil)
    @name = name
    @genre = genre
    self.song = song if song 
    @songs = []
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
    genre = new(name) 
    genre.save  
    genre 
  end 
  
  def songs
    @songs
  end 
end
