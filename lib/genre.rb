class Genre   
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
    genre = self.new(name) 
    genre.save 
    genre  
  end 
  
  def songs 
    @songs 
  end 

  def add_song(song)
    if song.genre == nil 
      song.genre = self 
    end 
    unless self.songs.include?(song)
      @songs << song
    end 
  end 

  def artists 
    @artists = []
    songs.each do |song|
      if !@artists.include?(song.artist)
        @artists << song.artist 
      end
    end 
    @artists 
  end 
end 