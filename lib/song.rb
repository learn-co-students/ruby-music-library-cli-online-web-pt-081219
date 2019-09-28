class Song
  attr_accessor :name
  attr_reader :artist, :song

  @@all = []
  def initialize(name, artist = nil, song = nil)
    @name = name
    @artist = artist
    @song = song
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = new(name)
    song.save
    song
  end
  attr_reader :artist, :genre
end
