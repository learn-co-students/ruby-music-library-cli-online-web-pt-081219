require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
@@all = []
  def initialize(name, artist = nil, genre = nil)
    #binding.pry
    @name = name
    #invokes #artist= instead of simply assigning to an @artist instance variable to ensure that associations are created upon initialization
    self.artist = artist if artist
    self.genre = genre if genre
    @@all
  end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  genre.songs << self if !genre.songs.include?(self)
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

  def self.find_by_name(name)
    all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || create(name)
  end

  def self.new_from_filename(file)
    file = file.gsub(".mp3","")
    artist, song, genre = file.split(" - ")
    song_artist = Artist.find_or_create_by_name(artist)
    song_genre = Genre.find_or_create_by_name(genre)
    new_song = Song.new(song, song_artist, song_genre)
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).tap{|song|song.save}
  end
end