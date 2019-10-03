class Song
  extend Concerns::Findable
  include Persistable::InstanceMethods
  extend Persistable::ClassMethods

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    unless artist.nil?
      self.artist = artist
    end
    unless genre.nil?
      self.genre = genre
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def artist=(artist)
    if artist.nil?
      assign_artist(nil)
    else
      artist.add_song(self)
    end
  end

  def assign_artist(artist)
    @artist = artist
  end

  def genre=(genre)
    if genre.nil?
      assign_genre(genre)
    else
      genre.add_song(self)
      unless genre.songs.include?(self)
        genre.songs << self
      end
    end
  end

  def assign_genre(genre)
    @genre = genre
  end

  def self.new_from_filename(file)
    artist, song_name, genre = file.split(" - ")
    genre.chomp!(".mp3")

    song = find_by_name(song_name) || Song.new(song_name)

    song.artist = Artist.find_or_create_by_name(artist) # string
    song.genre = Genre.find_or_create_by_name(genre)

    song
  end

  def self.create_from_filename(file)
    new_from_filename(file).save
  end
end