class Genre  
  extend Concerns::Findable
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def self.all 
    return @@all 
  end 
  
  def save
    self.class.all.push(self) 
  end 
  
  def self.destroy_all
    all.clear
  end 
  
  def self.create(name)
    genre = new(name)
    genre.save
    return genre 
  end 
  
  def artists
    songs.collect{|n| n.artist}.uniq
 end 
end 