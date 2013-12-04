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
data = parser.grab_data('data')
catalog = parser.parse_song_titles(data)
parser.make_objects(catalog)
# ([["bob", "song1", "genre1"],["bob", "song2", "genre2"]])

def print_artists
  Artist.all.each do |artist|
    check_artist_song_count(artist)
  end
  puts "There are #{Artist.count} artists in the catalog.\n"
end

def check_artist_song_count(artist)
  if artist.songs_count < 2
    puts "#{artist.name} - #{artist.songs_count} song"
  else
    puts "#{artist.name} - #{artist.songs_count} songs"
  end
end

def print_artist_songs
  puts "\nSelect Artist.\n"
  user_choice = gets.chomp.capitalize
  num = 1
  Artist.all.each do |artist|
     if user_choice == artist.name
      check_artist_song_count(artist)
      artist.songs.each do |song|
        puts "#{num}.#{song.name}"
        num += 1
      end
     end
    end
  end

def print_genres
  Genre.all.each do |genre|
    puts "#{genre.name}: #{genre.songs.size} Songs, #{genre.artists.size} Artists"
  end
  puts "There are #{Genre.all.size} genres in the catalog.\n"
end

def print_genre_songs
  puts "\nSelect Genre.\n"
  user_choice = gets.chomp.downcase
  num = 1
  Genre.all.each do |genre|
     if user_choice == genre.name
      genre.songs.each do |song|
        puts "#{num}. #{song.artist.name} — #{song.name}"
        num += 1
      end
     end
    end
  end

def show_song_page
  # debugger
  puts "\nSelect Song.\n"
  user_choice = gets.chomp.capitalize
  song = nil
  Genre.all.each do |genre|
    break if song
    song = find_song(user_choice, genre.songs)
  end
  if song.nil?
    puts "Please try again"
  else
    puts "\n#{song.name}'s artist is #{song.artist.name}" 
    puts "#{song.name}'s genre is #{song.genre.name}"
  end
end


def find_song(song, array)
  song_array = array.select do |song|
    if song == song
      song
    end
  end
  song_array.first
end

def say_hello
  puts "Hello. Would you like to browse by artist or genre? Type exit to quit"
  answer = gets.chomp.downcase 
  looping = true
  while looping
    if answer == "artist"
      print_artists
      print_artist_songs
      break
    elsif answer == "genre"
      print_genres
      print_genre_songs
      show_song_page
      break
    elsif answer == "exit"
      looping = false
    else
      puts "Sorry I did not understand"
    end
  end
end



say_hello
#ap Artist.all.inspect 


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