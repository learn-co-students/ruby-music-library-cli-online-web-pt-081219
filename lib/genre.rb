class Genre
  extend Concerns::Findable
  
  attr_accessor :name
  
  @@all = []
  
  #INIT
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end
  
  #CLASS METHODS
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  #INSTANCE METHODS
  def save
    @@all << self
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    @songs.include?(song) ? nil : @songs << song
  end
  
  def artists
    self.songs.collect{|song| song.artist}.uniq
  end
end