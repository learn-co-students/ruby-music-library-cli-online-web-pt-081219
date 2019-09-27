require "pry"
class Song 
  # extend Concerns::Findable 
  
  attr_accessor :name, :genre  
  attr_reader :artist 
  
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name 
    @genre = genre 
    if genre != nil 
      self.genre = genre 
    end 
    if artist != nil 
      self.artist = artist 
    end 
  end 

  def save
    @@all << self 
  end 
  
  def self.all
    @@all 
  end 
  
  def self.destroy_all
    self.all.clear 
  end 

  def self.create(name) 
    new_song = self.new(name) 
    new_song.save 
    new_song
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 
  
  def genre 
    @genre 
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.add_song(self)
  end 
  
  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name  
    end 
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || Song.create(name)
  end 
  
  def self.new_from_filename(file_name)

    artist_name = file_name.split(" - ")[0]
    song_title = file_name.split(" - ")[1]
    genre_name = file_name.split(" - ")[2].chomp(".mp3")
    
    song = self.find_or_create_by_name(song_title)
    song.artist = Artist.find_or_create_by_name(artist_name)  
    song.genre = Genre.find_or_create_by_name(genre_name)
    song 
  end 
  
  def self.create_from_filename(file)
    new_file = self.new_from_filename(file)
    new_file.save 
  end 
  
end 