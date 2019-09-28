require_relative './concerns/findable'

class Artist
  extend Concerns::Findable
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
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
  
  #INSTANCE METHODS
  def add_song(song)
    song.artist ? nil : song.artist = self
    @songs.include?(song) ? nil : @songs << song
  end
  
  def songs
    @songs
  end
  
  def genres
    self.songs.collect{|song| song.genre}.uniq
  end
end