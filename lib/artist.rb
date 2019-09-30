class Artist 
    attr_accessor :name
    extend Concerns::Findable
    @@all = []

    def initialize(name)
        @name = name 
        @songs = []
        save
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
        artist = Artist.new(name)
    end 

    def songs 
        @songs
    end 

    def add_song(song) 
        if !@songs.include?(song)
            @songs << song 
        end 
        if song.artist == nil 
            song.artist = self 
        end  
    end 
    
    def genres 
        songs.map{ |song| song.genre}.uniq
    end 

end 