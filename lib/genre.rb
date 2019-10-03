class Genre
  extend Concerns::Findable 
  include Persistable::InstanceMethods
  extend Persistable::ClassMethods

  attr_accessor :name, :songs
  attr_writer :artists
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def add_song(song)
    if song.genre.nil?
      song.assign_genre(self)
    end
  end

  def artists
    list = []
    @songs.each do |song|
      unless list.include?(song.artist)
        list << song.artist
      end
    end
    list
  end
end
