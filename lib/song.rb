class Song 
  attr_accessor :name, :artist, :genre 
  
  @@all = []
  
  def initialize(name, artist=nil, genre=nil)
    @name = name 
    self.artist = artist if artist
    self.genre = genre if genre 
  end 
  
  def self.all 
    return @@all
  end 
  
  def save
    self.class.all.push(self) 
  end 
  
  def self.destroy_all
    self.all.clear
  end 
  
  def self.create(name)
    song = new(name)
    song.save
    return song 
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include?(self)
  end 
  
  def self.find_by_name(name)
    all.find{ |n| n.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end
  
  def self.new_from_filename(filename)
    file_name = filename.split(" - ")
    
    artist_name = file_name[0]
    song_name = file_name[1]
    genre_name = file_name[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
  end
  
  def self.create_from_filename(filename)
    new_from_filename(filename).save
 end 
end 
  
  
  
  
  
  
    
  
  