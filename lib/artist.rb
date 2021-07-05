class Artist 
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
song = Artist.new(name)
song.save
song 
end 

def save 
Artist.all << self 
end 

def initialize(name)
@name = name 
@songs = Array.new 
end 

def songs
@songs  
end 

def add_song(song)
song.artist = self if song.artist == nil
self.songs << song unless self.songs.include?(song)
end 

def genres 
self.songs.map {|songs| songs.genre}.uniq
end 

end 