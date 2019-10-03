class Artist
  extend Concerns::Findable
  include Persistable::InstanceMethods
  extend Persistable::ClassMethods

  attr_accessor :name, :songs
  attr_writer :genres
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    if song.artist.nil?
      song.assign_artist(self)
      @songs << song
    end
  end

  def genres
    list = []
    @songs.each do |song|
      unless list.include?(song.genre)
        list << song.genre 
      end
    end
    list
  end

end
