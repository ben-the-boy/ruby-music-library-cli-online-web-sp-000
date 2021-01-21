require 'pry'
class Song 
  attr_accessor :name
  attr_reader :artist, :genre  
 
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    if artist != nil
      self.artist = artist
    end 
    if genre != nil 
      self.genre = genre 
    end 
  end 
  
  def self.all
    @@all 
  end 
  
  def save
    @@all << self 
  end 
  
  def self.destroy_all 
    @@all.clear
  end 
  
  def self.create(song_name)
    song = Song.new(song_name)
    song.save
    song
  end 
  
  def artist=(artist)
    @artist = artist 
    @artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre 
    if !genre.songs.include?(self)
      genre.songs << self 
    end 
  end 
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else 
      self.create(name)
    end 
  end 
  
  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")
      song = self.new(filename_array[1])
      song.artist = Artist.find_or_create_by_name(filename_array[0])
      song.genre = Genre.find_or_create_by_name(filename_array[2].chomp(".mp3"))
      song
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end 
  
end 