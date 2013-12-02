require './lib/artist'
require './lib/genre'
require './lib/song'
require 'parser.rb'
require 'awesome_print'
require 'debugger'


artists.collect! do |artist|
	[[artist[0]], [artist[1].split("[")[0][0..-2]]]
end
#def make_artists
	artists.length do [index] 
		Artist.new(index[0], songs[1])
	end
#end
#make_artists

def make_genres
 	artists.length do [i] 
		Artist.new(name[i], songs[i])
	end
end

