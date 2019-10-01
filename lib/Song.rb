class Song

    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(song_name, artist = nil, genre = nil)
        @name = song_name
        self.artist = artist if artist
        self.genre = genre if genre
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(song_name)
        new_song = self.new(song_name)
        new_song.save
        new_song
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.find_by_name(song_name)
        self.all.detect {|song| song.name == song_name}
    end

    def self.find_or_create_by_name(song_name)
        find_by_name(song_name) || create(song_name)
    end

    def self.new_from_filename(filename)
        # artist - title - genre.mp3
        filename_parts = filename.split(" - ")
        # initialize(song_name, artist, genre)
        artist_name = filename_parts[0]
        song_name = filename_parts[1]
        genre_name = filename_parts[2].delete_suffix!(".mp3")
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        self.new(song_name, artist, genre)
    end

    def self.create_from_filename(filename)
        new_from_filename(filename).tap{ |song| song.save }
    end

    

end