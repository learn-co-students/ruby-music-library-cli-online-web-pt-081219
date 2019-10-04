require("concerns")

class Genre
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
    genre = Genre.new(name)
    
    genre.save
    
    genre
  end
  
  def add_song(song)
    if !song.genre
      song.set_genre(self)
      
      @songs << song
    end
  end
  
  def artists
    artists = @songs.map { |song| song.artist }
    
    artists.uniq 
  end
end