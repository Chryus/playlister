require './parser'
require 'awesome_print'
require 'debugger'

# Your CLI should prompt the user with "Browse by artist or genre".  If they type "artist" and hit enter it should take them to the next section which should print out a list of artists, or genres.  The artist index must list all the artists. This list must be sorted alphabetically.
# In addition to the Artists name, the artists total song count should be displayed.  This list should also say how many Artists there are in total.  Your CLI should prompt the user with "Select Artist"
# When they type in the name of an artist your program should print out a list of songs and genres. For example
####################################################
######Dave Matthews Band - 2 Songs  
######1. Tripping Billies - Uncool Jam Bands  
######2. What Would You Say - Bands Blake Liked in 1996  
parser = Parser.new
parser.make_objects

def print_artists
  Artist.all.each do |artist|
    #if artist.songs_count < 2
      puts artist.name
    #else
      #puts "#{artist.name} - #{artist.songs_count} songs"
    #end
  end
  puts "There are #{Artist.count} artists in the catalog.\n"
end

def print_artist_songs
  puts "\nSelect Artist.\n"
  user_choice = gets.chomp.capitalize
  num = 1
  Artist.all.each do |artist|
     if user_choice == artist.name
      artist.songs.each do |song|
        puts "#{artist.name} — #{artist.songs_count}(song)s"
        puts "#{num}.#{song.name}"
        num += 1
      end
     end
    end
  end

def say_hello
  puts "Hello. Would you like to browse by artist or genre?"
  answer = gets.chomp.downcase 
  if answer == "artist"
    print_artists
    print_artist_songs
  elsif choice == "genre"
    genre_catalog = []
    #print list of all artists alphabetically with song count.
    catalog.each do |file|
      genre_catalog << file[2]
  end

    #ap genre_catalog.uniq!
    puts "There are #{genre_catalog.count} genres."
    #print list of all genres sorted by the amount of songs
    #the number of songs and number artists per genre should be included
    #user select genre
    #they should be taken to the individual genre "page"
    #the genres page should list the name of the songs, linking to the individual song and artists 
    #Also include the total unique artists and song counts in the genre
    #a user should be able to type artist name M83 and be taken to M83's artist "page" 
    #or type song name Midnight City and get taken to the songs "page"
    #the song page should list all the available info on the song, it's artist and genre.
  else
    puts "Sorry I did not understand"
  end
end

say_hello
ap Artist.all.inspect 
# The Genre interface for the CLI should prompt the user with "Select Genre"
# The genre index must list all the genres. This list must be sorted by the amount of songs.
# In addition to the Genres name, the total song and artist count should be listed along side it.

# Folk: 8 Songs, 3 Artists
 
# Once the user types a genre and hits enter they should be taken to the individual genre "page"
 
# The genres page should list the name of the songs, linking to the individual
# \# song and artists. Also include the total unique artists and song counts in the genre.
 
# ####Folk    
# #####1. M83 - Midnight City  
# #####2. Lady Gaga - Pokerface  
 
# So a user should be able to type M83 and be taken to M83's artist "page" or Midnight City and get taken to the songs "page".  The song page should list all the available information on the song, it's artist and genre.
 
# If a user types the artist or genre, they should be taken to the genre or artists "page"/interface
# \# Extra Credit:
# \# Use a ruby module somewhere to refactor common functionality.

# Note: if someone browses by artist, and sees the artist has 4 songs and enters song 4, this is song 4 from the entire list of songs, not just the songs we just displayed for the artist.  This is ok, lets not overcomplicate things.