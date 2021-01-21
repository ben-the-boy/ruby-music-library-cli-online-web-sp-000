require 'pry'
class Artist 
  extend Concerns::Findable
  
  attr_accessor :name, :songs  
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
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
  
  def self.create(artist_name)
    artist = Artist.new(artist_name)
    artist.save
    artist 
  end 
  
  
  def add_song(song)
    if song.artist == nil 
      song.artist = self
    end 
      if !self.songs.include?(song)
        self.songs << song
      end
  end 
  
  def genres
    genres_array = self.songs.map do |song|
      song.genre
    end
    genres_array.uniq 
  end 
  
end 