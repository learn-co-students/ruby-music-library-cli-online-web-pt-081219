class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs
  #attr_reader :songs
@@all = []
  def initialize(name)
    #binding.pry
    @name = name
    @songs = []
    @@all
  end

  def add_song(songs)
    # @songs << songs
    songs.artist = self unless songs.artist == self
    @songs << songs unless @songs.include?(songs)
  end

  def genres
    x = songs.collect do |song|
      song.genre
    end.uniq
  end

  def songs
    @songs
  end

  def self.all
   @@all
  end

  def save
   @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    @song = self.new(name)
    @song.save
    @song 
  end
end