require './lib/artist'
require './lib/genre'
require './lib/song'
require 'awesome_print'
require 'debugger'


mp3files = []
artists = []
genres = []
songs = []
#returns an array containing all the file names in a given directory, sans the current and parent directors (. & ..)
	Dir.foreach('data') do |item|
		next if item == '.' || item == '..'
		mp3files << item
 		artists << item.split(" - ")
 		genres << item.split(" [")[1][0..-6]
 		songs << item.split(" - ")[1].split("[")[0][0..-2]
		end
#ap mp3files
#ap artists
ap genres.uniq
#ap songs

def make_artists
	artists.length do [i] 
		Artist.new(name[i], songs[i])
	end
end

def make_genres
 	artists.length do [i] 
		Artist.new(name[i], songs[i])
	end
end

