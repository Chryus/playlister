
require 'awesome_print'

#require '.genre.rb'

class Artist

	attr_accessor :name, :songs

	All = []
	
	def initialize
		All << self
		@songs = []
	end

	#take the instance object songs and call .length on it to determine
	#the number of songs and artists has
	def songs_count
		songs.length
	end

	def add_song(song)
		#push the new song to the object artist's song's array
    songs << song
    #the name of the artist object is the result of calling artist on the song
    #not all song objects also include the name of the artists  
    song.artist = self
  end

	def genres
		songs.collect {|song| song.genre }.uniq
	end

	def self.count
		All.size
	end

	def self.reset_artists
		All.clear
	end

	def self.all 
		All
	end

end



