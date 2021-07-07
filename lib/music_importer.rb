class MusicImporter
  attr_accessor :path 
  
  def initialize(path)
    @path = path 
  end 
  
  def files 
    @files = Dir.glob("#{path}/*.mp3").collect {|n| n.gsub("#{path}/", "")}
  end 
  
  def import
    files.map {|n| Song.create_from_filename(n)}
  end 
end 