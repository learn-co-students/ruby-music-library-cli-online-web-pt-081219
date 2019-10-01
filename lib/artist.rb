class Artist 
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
    self.all.clear
  end 
  
  def self.create(name)
    artist = new(name)
    artist.save
    return artist
  end 
  
  def add_song(song)
    song.artist = self unless song.artist 
    songs << song unless songs.include?(song)
  end 
  
  def genres 
    songs.collect{|n| n.genre}.uniq
 end 
end 