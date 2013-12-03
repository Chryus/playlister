require 'awesome_print'
require 'debugger'
require './lib/artist'
require './lib/song'
require './lib/genre'

class Parser 
  
  attr_reader :catalog, :artist_list
  
  def initialize
    @catalog = parse_songs
    @artist_list = create_artist_hash
  end

  def parse_songs
    files = Dir.entries('data').select { |f| !File.directory? f}
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

#create hash with artist & number of songs.
  def create_artist_hash
    artist_songs = {}
    catalog.collect do |file|
      file[0]
      if artist_songs[file[0]].nil? 
        artist_songs[file[0]] = 1
      else
        artist_songs[file[0]] += 1
      end
    end
    artist_songs
  end

#iterate over hash, printing artists alphabetically with song count.
  def print_artists
    artist_list.each do |artist, count|
      if count < 2
        puts "#{artist} - #{count} song"
      else
        puts "#{artist} - #{count} songs"
      end
    end  
  end

def print_artist_songs
  puts "There are #{catalog.count} artists in the catalog. Select Artist."
  artist_choice = gets.chomp.capitalize
  artist_song = catalog.collect do |file|
    if file[0] == artist_choice
      file[1]
    end
  end
  puts artist_song.compact!
end
  
end




# artist = /((.*) (?=\-))/
# song = /(?<=\-\s).*(?=\s\[)/
# genre = /(?<=\[).*(?=\])/

# our_artist = files[0].match(artist)
# our_song = files[0].match(song)
# our_genre = files[0].match(genre)

# parser = Parser.new
# parser.catalog
# parser.artist_list
# parser.print_artists


  #  files = Dir.entries('data').select { |f| !File.directory? f}
  # ap parse_songs(files)
#end



    #make an aray with 3 elements(artist, song, genre)
    #split by non 
    #see the opening brackets and grab everything before the closing brackets
    # parse_files(files).each do |mp3|
    # 	if artist.name == mp3[0] 
    # 	Artist.new.name = mp3[0] 
    # 	Song.new.name = mp3[1] 
    # 	Genre.new.name = mp3[2]
    # end



    # ap Artist.all

	# def parse_artists
	# 	all_songs.collect {|item| item.split(" - ")}
 # 	end

 # 	def parse_songs
 # 		all_songs.collect { |item| item.split(" - ")[1].split("[")[0][0..-2]}
	# end

	# def parse_genres
	# 	all_songs.collect { |item| item.split(" [")[1][0..-6] }
	# end

	# def animate_artists
	# 	parse_artists.each do |artist|
	# 		artists = Artist.new
	# 	end
	# end



	# animate_artists
 # # end

 # # mas = Parser.new
 # # ap mas.genres




