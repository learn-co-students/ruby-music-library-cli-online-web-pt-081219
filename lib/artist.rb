require("concerns")

class Artist
  attr_accessor :name, :songs
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
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
    artist = Artist.new(name)
    
    artist.save
    
    artist
  end
  
  def add_song(song)
    if !song.artist
      song.set_artist(self)
      
      @songs << song
    end
  end
  
  def genres
    genres = @songs.map { |song| song.genre }
    
    genres.uniq
  end
end