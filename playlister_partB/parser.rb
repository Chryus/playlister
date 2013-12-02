require './lib/artist'
require './lib/genre'
require './lib/song'
require 'awesome_print'
require 'debugger'

 # class Parser
	
 # 	attr_accessor :mp3s, :artists, :songs, :genres

	# def initialize
	# 	@mp3s = all_songs
	# 	@artists = parse_artists
	# 	@songs = parse_songs
	# 	@genres = parse_genres
	# end

#returns an array containing all the file names in a given directory, sans the current and parent directors (. & ..)
	
	files = Dir.entries('data').select {|f| !File.directory? f}

    #make an aray with 3 elements(artist, song, genre)
    #split by non 
    #see the opening brackets and grab everything before the closing brackets
    artist = /((.*) (?=\-))/
    song = /(?<=\-\s).*(?=\s\[)/
    genre = /(?<=\[).*(?=\])/
    #m = files[0].match(artist)
    #z = files[0].match(song)
    #x = files[0].match(genre)

    def parse_files(files)
    	artist = /((.*) (?=\-))/
    	song = /(?<=\-\s).*(?=\s\[)/
    	genre = /(?<=\[).*(?=\])/
	    catalogue = []
	    files.each do |item|
	    	song_array = []
	    	m = item.match(artist).to_s
	    	z = item.match(song).to_s
	    	x = item.match(genre).to_s
	    	song_array << m << z << x
	    	catalogue << song_array
	    end
	    catalogue
	  end
    ap parse_files(files)



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




