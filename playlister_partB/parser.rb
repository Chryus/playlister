require './lib/artist'
require './lib/genre'
require './lib/song'
require 'awesome_print'
require 'debugger'

 class Parser
	
 	attr_accessor :mp3s, :artists, :songs, :genres

#returns an array containing all the file names in a given directory, sans the current and parent directors (. & ..)
	def initialize
		@mp3s = all_songs
		@artists = parse_artists
		@songs = parse_songs
		@genres = parse_genres
	end

	def all_songs
    Dir.entries('data').select {|f| !File.directory? f}
  end

	def parse_artists
		all_songs.collect {|item| item.split(" - ")}
 	end

 	def parse_songs
 		all_songs.collect { |item| item.split(" - ")[1].split("[")[0][0..-2]}
	end

	def parse_genres
		all_songs.collect { |item| item.split(" [")[1][0..-6] }
	end
 end



 mas = Parser.new
 ap mas.genres




