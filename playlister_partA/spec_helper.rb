require 'awesome_print.rb'
# require '../lib/artist.rb'
# require '../lib/genre.rb'
# require '../lib/song.rb'


RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
end


each song will have an instance var of artist and genre
each genre will have an instance var of song and artist

each artist will have an instance var of genre and song
def add_song(song)
	SONGS << song
end
