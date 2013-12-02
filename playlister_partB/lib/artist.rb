
require 'awesome_print'

#require '.genre.rb'

class Artist

	attr_accessor :name, :songs

	ARTISTS = []
	
	def initialize
		@name = name
		@songs = []
		ARTISTS << self
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
		ARTISTS.length
	end

	def self.reset_artists
		ARTISTS.clear
	end

	def self.all 
		ARTISTS
	end

end



# max = Artist.new
# ap max.add_song("peaches")
# ap Artist::ARTISTS.inspect
# ap max.genre



# pete = Artist.new
# john = Artist.new
# puts Artist.all

#BIG TAKEAWAY.....
#ARTISTS << self is doing a lot of work here
# 1. it keeps track of artists as they are created
# 2. it allows you to keep track of Artists as they are created

# def self.all
# 	ARTISTS.each do |artist|
# 		artist
# 	end
# end

# def self.all 
# 	ARTISTS.collect {|artist| artist}
# end

# def genres
# 	genres_array = []
# 	song.each do |song|
# 		genres_array << song.genre
# 	end
# 	genres_array
# end

#refactor as...

# def genres
# 		songs.collect {|song| song.genre }.uniq
# end



#each artist will have an instance var of genre and song

