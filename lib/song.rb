class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist = artist
    end
    if genre
      self.genre = genre
    end
  end
  
  def self.all
    @@all
  end
  
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  
  
  #def self.find_by_name(name)
   # @@all.find{|song| song.name == name}
 # end
  
  #def self.find_or_create_by_name(name)
  #  if find_by_name(name)
   #   find_by_name(name)
   # else
   #   create(name)
   # end
 # end
 
 def self.new_from_filename(filename)
    file = filename.split(" - ")
    artist = Artist.find_or_create_by_name(file[0])
    genre = Genre.find_or_create_by_name((file[2]).chomp(".mp3"))
    song = Song.new(file[1], artist, genre)
    song
  end
  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    
  end
end