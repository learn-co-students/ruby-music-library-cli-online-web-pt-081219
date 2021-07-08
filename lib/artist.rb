require_relative './concerns/findable.rb'


class Artist
  
  extend Concerns::Findable
  
  attr_accessor :name, :songs, :genres
  
  @@all = [] 
  
  def initialize(name)
    @name = name 
    @songs = []
    @@all << self
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
    song = Artist.new(name)
    song
  end
  
  def add_song(song)
    if !song.artist
      song.artist = (self)
    end
    if !@songs.any?(song)
      @songs << song
    end
  end
  
  def genres
   genre_list = []
   Song.all.map do |song|
     if song.artist == self && !genre_list.any?(song.genre) 
       genre_list << song.genre
     end
   end
  genre_list
  end

end