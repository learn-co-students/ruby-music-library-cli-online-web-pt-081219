require_relative "../config/environment"
class Song 
  attr_accessor :name, :artist, :genre
   @@all = []
  extend Concerns::Class_methods
  extend Concerns::Findable
  include Concerns::Instance_methods

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil 
    
  end 
   
  def self.all
    @@all 
  end  
  
  def self.new_from_filename(file_name)
    firts_split = file_name.split(" - ") 
    artist_name = firts_split[0]
    song_name = firts_split[1] 


    genre_name = firts_split[2].split(".")[0]
    
     
   
    new_song = Song.find_or_create_by_name(song_name)
    new_song.save
     new_genre = Genre.find_or_create_by_name(genre_name)
     new_genre.save
      new_artist = Artist.find_or_create_by_name(artist_name)
      new_artist.save
      new_song.artist = new_artist 
      new_song.genre = new_genre  
      new_song
     
  end 
  
  def self.create_from_filename(fillename)
    self.new_from_filename(fillename)
  end
  
  def artist=(artist_object)
    @artist = artist_object 
    artist_object.add_song(self)
  end
  
  def genre=(genre_object)
    @genre = genre_object 
    genre_object.songs << self if !genre_object.songs.include?(self)
  end
 
   
end