

# parser = Parser.new
# parser.parse_and_make_objects
#ap Artist.all

  # generic version of all three
  # def make_thing(file, some_class, position)
  #   some_instance = some_class.new
  #   some_instance.name = file[position]
  #   some_instance
  # end

  # def make_artists(files)
  #   # files = grab_data('data')
  #   parse_song_titles(files).each do |file|  
 
  #   end
  # end

# artist = /((.*) (?=\-))/
# song = /(?<=\-\s).*(?=\s\[)/
# genre = /(?<=\[).*(?=\])/

# our_artist = files[0].match(artist)
# our_song = files[0].match(song)
# our_genre = files[0].match(genre)

  #  files = Dir.entries('data').select { |f| !File.directory? f}
  # ap parse_songs(files)
#end

    #make an aray with 3 elements(artist, song, genre)
    #split by non 
    #see the opening brackets and grab everything before the closing brackets
    # 

    # ap Artist.all

	# def parse_artists
	# 	all_songs.collect {|item| item.split(" - ")}
 # 	end

 # 	def parse_songs
 # 		all_songs.collect { |item| item.split(" - ")[1].split("[")[0][0..-2]}
	# end

	# def parse_genres
	# 	all_songs.collect { |item| item.split(" [")[1][0..-6] }
	# end

	# def animate_artists
	# 	parse_artists.each do |artist|
	# 		artists = Artist.new
	# 	end
	# end

	# animate_artists
 # # end

 # # mas = Parser.new
 # # ap mas.genres

 


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
#   ARTISTS.each do |artist|
#     artist
#   end
# end

# def self.all 
#   ARTISTS.collect {|artist| artist}
# end

# def genres
#   genres_array = []
#   song.each do |song|
#     genres_array << song.genre
#   end
#   genres_array
# end

#refactor as...

# def genres
#     songs.collect {|song| song.genre }.uniq
# end



#each artist will have an instance var of genre and song