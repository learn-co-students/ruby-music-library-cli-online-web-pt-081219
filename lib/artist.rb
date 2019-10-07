class Artist
  extend Concerns::Findable
  @@all = []
  
  attr_accessor :name, :songs, :genres
  
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
    @@all.clear
  end
  
  def self.create(name)
    self.new(name)
  end
  
  def add_song(song)
    song.artist = self unless song.artist != nil
    @songs << song unless @songs.include?(song)
  end
  
  def genres
    self.songs.map{|song| song.genre}.uniq
  end
  
end

module Concerns::Findable
end