# U2.W6: Create a Playlist from Driver Code


# I worked on this challenge by myself (cjcjameson).


# Pseudocode
# Declare a class Song that initializes with the song name and artist name
# Song has the method play
# Declare a class Playlist that initializes with any number of song objects, arranged into an instance variable array to hold them
# Playlist has methods add, remove (taking a song object name), includes?(taking a song), play_all, and list


# Initial Solution

# class Song
# 	attr_reader :title, :artist

# 	def initialize(title, artist)
# 		@title = title
# 		@artist = artist
# 	end

# 	def play
# 		p "Dooo Doooo Dah Dah #{@title} Dah Dah Dooooo... You recognize that sound, it's #{@artist}!"
# 	end
# end

# class Playlist
# 	def initialize(*songs)
# 		@songs = songs.to_a
# 	end

# 	def add(*songs)
# 		songs.each {|new_song| @songs << new_song }
# 	end

# 	def num_of_tracks
# 		return @songs.length
# 	end

# 	def remove(*songs)
# 		songs.each {|song| @songs.delete(song)}
# 	end

# 	def include?(song)
# 		return @songs.include?(song)
# 	end

# 	def play_all
# 		@songs.each {|song| song.play}
# 	end

# 	def list
# 		@songs.each_with_index {|song,index|
# 			p "#{index+1}. #{song.title} by #{song.artist}"
# 		}
# 	end
# end


# Refactored Solution

class Song
	attr_reader :title, :artist

	def initialize(title, artist)
		@title = title
		@artist = artist
	end

	def play
		p "Dooo Doooo Dah Dah #{@title} Dah Dah Dooooo... You recognize that sound, it's #{@artist}!"
	end
end

class Playlist
	def initialize(*songs)
		@songs = songs.to_a
	end

	def add(*songs)
		songs.each {|new_song| @songs << new_song }
	end

	def num_of_tracks
		return @songs.length
	end

	def remove(*songs)
		songs.each {|song|
			if include?(song) == false #added this error checking
				raise ArgumentError, "this song isn't here--can't remove it"
			end
			@songs.delete(song)
		}
	end

	def include?(song)
		return @songs.include?(song)
	end

	def play_all
		if num_of_tracks>0 #added this check
			raise ArgumentError, "nothing to play"
		end
		@songs.each {|song| song.play}
	end

	def list
		if num_of_tracks>0 #added this check
			raise ArgumentError, "nothing to list"
		end
		p "__Track List__"
		@songs.each_with_index {|song,index|
			p "#{index+1}. #{song.title} by #{song.artist}"
		}
	end
end




# DRIVER TESTS GO BELOW THIS LINE
one_by_one = Song.new("One by One", "Sirenia")
world_so_cold = Song.new("World So Cold", "Three Days Grace") 
going_under = Song.new("Going Under", "Evanescence")
 
my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)

lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")
 
my_playlist.add(lying_from_you, angels)
p my_playlist.num_of_tracks == 5
going_under.play
my_playlist.remove(angels)
p my_playlist.include?(lying_from_you) == true #renamed include? to be consistent with standard ruby
my_playlist.play_all
my_playlist.list #renamed this show rather than display

empty_playlist = Playlist.new()



# Reflection 

# Good challenge to whip through quickly. The refactoring let me add more error checking.
# I didn't see much to improve on in the driver code...was I missing somehing?