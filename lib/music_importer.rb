class MusicImporter
  
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    files = Dir.glob("#{path}**/*")
    files = files.collect{|file|file.scan(/(?<=mp3s\/)(.*)/)}.flatten
  end
  
  def import
    self.files.each{|filename| Song.create_from_filename(filename)}
  end

end