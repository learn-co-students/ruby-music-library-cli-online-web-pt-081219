class MusicImporter 
  attr_accessor :path,:files
  def initialize(path) 
    @path = path 
    @files = Dir["#{path}/*.mp3"]
  end
  
  def files
    normalized_array =[]
    @files.each {|el| normalized_array << el.split(/\.\/.+\/.+\/.+\//)[1]}
    normalized_array
  end 
  
  def import
    files.each{|file| Song.create_from_filename(file)}
  end

end