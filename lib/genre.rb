class Genre 
extend Concerns::Findable

attr_accessor :name 
@@all = Array.new 

def self.all 
@@all  
end 

def self.destroy_all 
all.clear
end 

def self.create(name)
song = Genre.new(name)
song.save
song 
end 

def save 
Genre.all << self 
end 

def initialize(name)
@name = name 
@songs = Array.new 
end 

def songs 
@songs   
end 

def add_song(song)
song.genre = self if song.genre == nil
self.songs << song unless self.songs.include?(song)
end 

def artists 
self.songs.map {|songs| songs.artist}.uniq 
end 
  
end 
