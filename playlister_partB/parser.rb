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

  def make_objects(catalog)
    #files = grab_data(location)
    #parse_song_titles(files)
    catalog.each do |file|
      artist = make_artist(file)
      song = make_song(file)
      artist.add_song(song)
      genre = make_genre(file)
      song.genre = genre
      genre.artists
    end
  end

  def make_song(file)
    name = file[1]
    song = Song.new
    song.name = name
    song
  end

  #checks for duplicates
  def make_genre(file)
    genre_name = file[2] #get the genre
    genre_object = nil
    if Genre.all.length == 0
      new_genre = Genre.new
      new_genre.name = genre_name
      genre_object = new_genre
      return new_genre
    else
      genre = Genre.all.select {|genre| genre.name == genre_name}
      if genre.empty?
        newer_genre = Genre.new
        newer_genre.name = genre_name
        genre_object = newer_genre 
      else
        genre_object = genre.first
      end       
    end
    return genre_object
  end

  #checks for duplicates
  def make_artist(file)
    artist_name = file[0] #get the name
    artist_object = nil
    if Artist.all.length == 0
      new_artist = Artist.new
      new_artist.name = artist_name
      artist_object = new_artist
    else
      artist = Artist.all.select {|artist| artist.name == artist_name}
      if artist.empty?
        newer_artist = Artist.new
        newer_artist.name = artist_name
        artist_object = newer_artist 
      else
        artist_object = artist.first
      end       
    end
    return artist_object
  end
end

# parser = Parser.new
# parser.make_artist(["Beck", "Bob Dylan", "Willie Nelson"])
# ap Artist.all.count
# parser.make_artist(["Beck", "Rob Dylan", "Willie Nelson"])
# ap Artist.all.count
# parser.make_objects


      # Artist.all.each do |artist|
      #   debugger
      #   # adele is the current artist
      #   # look to see if shes in our artist array
      # puts "artist:name is :#{artist.name}, artist_name is :#{artist_name}" 
      #   if artist.name == artist_name #check if this name already exists
      #     return artist
      #   else
      #     newer_artist = Artist.new
      #     newer_artist.name = artist_name
      #     return newer_artist
      #   end
      # end



