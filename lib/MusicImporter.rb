require 'pry'
class MusicImporter
  
  attr_accessor :path 
  
  def initialize(path)
    @path = path
  end
  
  def files
    files = Dir.entries(@path)
    mp3_files = files.select do |filename|
      filename.end_with?("3")
    end
    mp3_files 
  end 
  
  def import
    files.each{|file| Song.create_from_filename(file)}
  end 
  
  
  
end 