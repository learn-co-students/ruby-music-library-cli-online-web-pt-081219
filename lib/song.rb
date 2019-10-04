class Song 
  attr_accessor :name, :artist, :genre
  @@all = []

  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
  #  @artist = artist 
  
  self.artist = artist if artist

 # @genre = genre 
  self.genre = genre if genre 
  
  end 


  def self.all 
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end 
  
  def save
    self.class.all << self 
  end 
  
  def self.create(name)
    song = new(name) 
    song.save  
    song 
  end 

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
 end 
end

