require 'awesome_print'
#require "./genre.rb"

class Song
  attr_accessor :artist, :name, :genre

  def initialize
  	@name = name
  	@genre = genre
  end
  
  #this is the explicit writer method
  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

end

#Amazing Kate's gchat help notes:
#because every time you assign a song a genre
#we not only want to set @genre to be that genre for the particular song
#but we also want to add the song to the songs array in the genre class
# also, the genre that you add to the instance of the song class isn't just 
#the name of the genre
# it's the whole genre object, which includes an array of artists

# [1,2].each do |song|
# 	Song.new
# end

# ap Song::SONGS.inspect

