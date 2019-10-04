class MusicImporter
  attr_accessor :song, :genre, :artist 
  
  def initialize(path)
    @path = path
  end

end