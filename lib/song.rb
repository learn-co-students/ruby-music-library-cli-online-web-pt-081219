require 'pry'

class Song 
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    #@artist = artist
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
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
    new = Song.new(name)
    new.save 
    new
  end 
    
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
    Artist.create(artist) unless Artist.all.detect {|art| art == artist}
  end 
  
  def genre=(genre)
    @genre = genre 
    @genre.add_song(self)
    Genre.create(genre) unless Genre.all.detect {|gen| gen == genre}
  end 
 
  def self.find_by_name(name)
    all.detect {|x| x.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) == nil 
      Song.create(name)
    else 
      Song.find_by_name(name)
    end 
  end 
  
  def self.new_from_filename(file)
    name = file.split(" - ")[1]
    artist_name = file.split(" - ")[0]
    genre_name = file.split(" - ")[2]
    genre_name = genre_name.split(".").first

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    # binding.pry
    song = self.new(name, artist, genre) 
  end 
  
  def self.create_from_filename(file)
    new = new_from_filename(file)
    new.save
  end


end 