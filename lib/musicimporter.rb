require "pathname"
require "pry-byebug"

class MusicImporter
  attr_accessor :path
  attr_writer :files

  def initialize(path)
    @path = path 
  end

  def files
    mp3files = Pathname.new(@path).glob("**/*.mp3")
    mp3files.map do |file|
      file.relative_path_from(@path).to_s
      # `*` any number of chars other than `/`
      # `**` any number of chars including `/`
      # `?` exactly one character other than `/`
      # `{x,y}` one of x or y
    end
  end

  def import
    files.map do |file|
      Song.create_from_filename(file)
    end
  end
end
