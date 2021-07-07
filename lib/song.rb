require "pry"
class Song 
    attr_accessor :name, :artist, :genre 
    @@all = []
    extend Concerns::Findable

    def initialize(name, artist = nil, genre = nil)
        @name = name 
        if artist
            self.artist = artist
          end
        if genre 
            self.genre = genre 
        end 
    end 

    def name 
        @name 
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
        song = Song.new(name)
        song.save 
        song
    end 
    
    def artist=(artist)
        @artist = artist 
        artist.add_song(self)
    end 

    def genre=(genre)
        @genre = genre 
        genre.add_song(self)
    end 

    # def self.find_by_name(name)
    #     @@all.find{|x| x.name == name}
    # end 

    # def self.find_or_create_by_name(name)
    #     self.find_by_name(name) || create(name)
    # end 

    def self.new_from_filename(filename)
        new_array = filename.split(" - ")
        song_name = new_array[1]
        song_artist = new_array[0]
        song_genre = new_array[2].chomp(".mp3")

        a = Artist.find_or_create_by_name(song_artist)
        g = Genre.find_or_create_by_name(song_genre)

        song = Song.new(song_name, a, g)
    end 

    def self.create_from_filename(filename)
       song = self.new_from_filename(filename)
       song.save
    end 

end 
