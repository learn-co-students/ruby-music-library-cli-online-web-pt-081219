class Artist  
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
      Song.new(song, self)
      song.artist = self 
    end 
    unless self.songs.include?(song)
      @songs << song
    end 
  end 
  
  def songs 
    @songs 
  end 

end 