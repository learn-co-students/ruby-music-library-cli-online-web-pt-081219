class Genre 
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
        genre = Genre.new(name)
    end 

    def songs 
        @songs 
    end 

    def add_song(song) 
        if !@songs.include?(song)
        @songs << song 
        end 
        if song.genre == nil 
        song.genre = self 
        end  
    end 

    def artists 
        songs.map{|song| song.artist}.uniq
    end 

end 