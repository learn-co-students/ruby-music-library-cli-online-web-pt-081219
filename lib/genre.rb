class Genre
attr_accessor :name
  extend Concerns::Findable
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    save
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
    song = Genre.new(name)
  end
  
  def add_song(song)
    if !@songs.include?(song)
      @songs << song
    end
  end
  
  def songs
    @songs
  end
  
  def artists
    @songs.map{|song| song.artist}.uniq
  end
end