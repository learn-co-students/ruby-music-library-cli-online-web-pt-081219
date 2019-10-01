class MusicImporter

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files 
        files = []
        Dir.new(self.path).each {|file| files << file if file.end_with?(".mp3")}
        files
    end

    def import
        files.each{|filename| Song.create_from_filename(filename)}
    end

end