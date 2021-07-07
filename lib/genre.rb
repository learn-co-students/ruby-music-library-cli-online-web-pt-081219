class Genre 
  extend Concerns::Findable
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all 
    @@all = []
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.create(name)
    new = Genre.new(name)
    new.save 
    new
  end   
  
  def songs
    @songs
  end 
  
  def add_song(song)
    if song.genre == nil 
      song.genre = self
    end 
    songs << song unless @songs.include?(song)
  end 
  
  def artists 
    @artists = songs.map {|song| song.artist} 
    @artists.uniq
  end 
  
end 