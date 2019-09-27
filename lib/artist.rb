require_relative "../config/environment"
class Artist 
  @@all = []
  attr_accessor :name, :songs, :genres
   extend Concerns::Class_methods
   extend Concerns::Findable
  include Concerns::Instance_methods
  def initialize(name) 
    @name = name
    @songs = []
  end 
  
  def genres 
    Genre.all
  end
  
  def self.all
    @@all
  end 
  
  def add_song(song_object)
   artist_oject =  self
   song_object.save 
    Song.all.each{|song| song.artist = artist_oject if song.artist == nil} 
    @songs << song_object if !@songs.include?(song_object)
 
  end
end