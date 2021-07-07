 #initialize
    #accepts a file path to parse MP3 files from
  #path
    #retrieves the path provided to the MusicImporter object
  #files
    #loads all the MP3 files in the path directory
    #normalizes the filename to just the MP3 filename with no path

class MusicImporter
  attr_accessor :path

  def initialize(path)
    @path = path
  end
  
  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{|file|file.gsub("#{path}/", "")}
  end

  def import
    files.each{|file| Song.create_from_filename(file)}
  end
end