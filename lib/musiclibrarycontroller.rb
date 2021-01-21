require 'pry'
class MusicLibraryController 
 
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import 
  end 
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.strip 
    if input != "exit"
      call 
    end 
  end
  
  def list_songs
    alphabetized = Song.all.sort_by {|song| song.name}
    alphabetized.each.with_index do |song, index|
      puts "#{(index.to_i + 1)}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end 
  end
  
  def list_artists
    alphabetized = Artist.all.sort_by {|artist| artist.name}
    alphabetized.each.with_index do |artist, index|
      puts "#{(index.to_i + 1)}. #{artist.name}"
    end 
  end
  
  def list_genres
    alphabetized = Genre.all.sort_by {|genre| genre.name}
    alphabetized.each.with_index do |genre, index|
      puts "#{(index.to_i + 1)}. #{genre.name}"
    end 
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if Artist.find_by_name(input)
      alphabetized = Artist.find_by_name(input).songs.sort_by {|song| song.name}
      alphabetized.each.with_index do |song, index|
        puts "#{(index.to_i + 1)}. #{song.name} - #{song.genre.name}"
      end 
    end 
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if Genre.find_by_name(input)
      alphabetized = Genre.find_by_name(input).songs.sort_by {|song| song.name}
      alphabetized.each.with_index do |song, index|
        puts "#{(index.to_i + 1)}. #{song.artist.name} - #{song.name}"
      end 
    end 
  end 
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    index = input.to_i - 1
    alphabetized = Song.all.sort_by {|song| song.name}
    chosen_song = alphabetized[index]
    total_songs = alphabetized.size
    if input.to_i.between?(1,total_songs)
      puts "Playing #{chosen_song.name} by #{chosen_song.artist.name}"
    end 
  end 
    
    
end 