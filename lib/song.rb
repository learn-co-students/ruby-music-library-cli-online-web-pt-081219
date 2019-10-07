class Song

  @@all = []
  
  attr_accessor :name, :artist, :genre
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    save
    self.artist = artist if artist
    self.genre = genre if genre
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    self.new(name)
  end
  
  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    self.genre.add_song(self)
  end
  
  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1]
    song_artist = filename.split(" - ")[0]
    song_genre = filename.split(" - ")[2].chomp(".mp3")
    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(song_artist)
    song.genre = Genre.find_or_create_by_name(song_genre)
    song
  end
  
  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end
  
end