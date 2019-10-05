class MusicImporter
  attr_accessor :song, :genre, :artist 
  
  def initialize(path)
    @path = path
  end

def path
  @path
  end
  
  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect {|file| file.gsub("#{path}/", "")}
    end
  end 