class Genre
  extend Concerns::Findable
  @@all = []
  
  attr_accessor :name, :songs
  
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
    song.genre = self unless song.genre != nil
    @songs << song unless @songs.include?(song)
  end
  
  def artists
    self.songs.map{|song| song.artist}.uniq
  end
  
end