require 'awesome_print'
require 'debugger'
require './lib/artist'
require './lib/song'
require './lib/genre'

class Parser 
  
  #attr_reader

  def initialize
 
  end

  def parse_song_titles(files)
    artist = /((.*) (?=\-))/
    song = /(?<=\-\s).*(?=\s\[)/
    genre = /(?<=\[).*(?=\])/
    catalog = []
    files.each do |item|
      song_array = []
      a = item.match(artist).to_s.strip
      s = item.match(song).to_s
      g = item.match(genre).to_s
      song_array << a << s << g
      catalog << song_array
    end
    catalog
  end

  def grab_data(location)
    Dir.entries(location).select { |f| !File.directory? f}
  end

  def make_objects
    files = grab_data('data')
    parse_song_titles(files).each do |file|
      artist = make_artist(file)
      song = make_song(file)
      #artist.add_song(song)
      #genre = make_genre(file)
      #song.genre = genre
      #genre.collect_artists
    end
  end

  def make_song(file)
    song = Song.new
    song.name = file[1]
    song
  end

  #checks for duplicates
  def make_genre(file)
    name = file[2] #get the genre
    if Genre.all.length == 0
      new_genre = Genre.new
      new_genre.name = name
      return new_genre
    else
      Genre.all.each do |genre|
        if genre.name == name
          return genre
        else
          newer_genre = Genre.new
          newer_genre.name = name
          return newer_genre
        end
      end
    end
  end

  #checks for duplicates
  def make_artist(file)
    name = file[0] #get the name
    if Artist.all.length == 0
      new_artist = Artist.new
      new_artist.name = name
      return new_artist
    else
      Artist.all.each do |artist| 
        if artist.name == name #check if this name already exists
          return artist
        else
          newer_artist = Artist.new
          newer_artist.name = name
          return newer_artist
        end
      end
    end
  end

end







