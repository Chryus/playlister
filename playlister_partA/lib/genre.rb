require 'awesome_print'
require "./lib/artist"
#each genre will have an instance var of song and artist

class Genre

	attr_accessor :name, :artists, :songs

	GENRES = []

	def initialize
		@artists = []
		@songs = []
		GENRES << self
	end

	#creates a new array with just the genre
	
	def self.reset_genres
		GENRES.clear
	end

	def artists
    songs.collect{|song| song.artist}.uniq
  end

	def self.all 
		GENRES.collect {|genre| genre}
	end

	# def songs
 #    @songs ||= []
 #  end
	
end

# Genre.new.tap{|g| g.name = 'rap'}
# Genre::GENRES.inspect

#genres have artists and and names, but not songs
