class Song 
  attr_accessor :name, :artist
  @@all = []

  
  def initialize (name, artist = nil)
    @name = name 
    @artist = artist 
    self.artist = artist if artist
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
    if @artist == nil
      @artist = artist
    else
      @artist = @artist
    end
    if self.artist != nil
      @artist.add_song(self)
    end
    @artist
  end
end