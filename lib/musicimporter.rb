class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    
    files = Dir[@path+"/*.mp3"]
    files.map{|file| file.slice!("#{@path}/")}
    files
  end
  
  def import
   self.files.each{ |filename| Song.create_from_filename(filename) }
  end


end