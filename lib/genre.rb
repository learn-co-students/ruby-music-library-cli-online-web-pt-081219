class Genre
  extend Concerns::Findable
  attr_accessor :name
  
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
    @name = name
    @@all << self
    self
  end
  
  def songs
    @songs
  end
  
  def artists
    songs.map(&:artist).uniq
  end
end