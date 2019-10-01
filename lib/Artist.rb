class Artist

    extend Concerns::Findable

    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
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

    def self.create(name)
        new_artist = self.new(name)
        new_artist.save
        new_artist
    end

    def add_song(song_name)
        song_name.artist = self unless song_name.artist
        songs << song_name unless songs.include?(song_name)
    end

    def genres
        songs.collect{ |song| song.genre }.uniq
    end

end