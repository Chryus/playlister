require './lib/artist'
require './lib/genre'
require './lib/song'
require 'awesome_print'
require 'debugger'

Dir.foreach('data') do |song|
	next if song == '.' || song == '..'
	ap song.inspect
end
