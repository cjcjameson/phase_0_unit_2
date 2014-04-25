# U2.W6: Create a BoggleBoard Class


# I worked on this challenge by myself (cjcjameson).


# 2. Pseudocode



# 3. Initial Solution
class BoggleBoard
	def initialize(board)
		@board = board
	end

	def create_word(*coords)
		coords.map { |coord| @board[coord.first][coord.last]}.join("")
	end

	def get_row(row)
    	return @board[row]
	end

	def get_col(column)
		@board.map {|row| row[column]}
	end

	def get_letter(row,col)
		return @board[row][col]
	end

	def get_diagonal(coord1,coord2)
		row_diff = coord2[0] - coord1[0]
		col_diff = coord2[1] - coord1[1]
		if row_diff.abs == col_diff.abs
			if row_diff >= 0
				row_coords = coord1[0].upto(coord2[0]).to_a
			else
				row_coords = coord1[0].downto(coord2[0]).to_a
			end
			if col_diff >= 0
				col_coords = coord1[1].upto(coord2[1]).to_a
			else
				col_coords = coord1[1].downto(coord2[1]).to_a
			end
			diag_coords = row_coords.zip(col_coords)
			output = ""
			(row_diff.abs + 1).times { |index|
				output += get_letter(row_coords[index],col_coords[index])
			}
			return output
		else
			raise ArgumentError.new("Not a valid diagonal")
		end
	end
end
 
 
dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board = BoggleBoard.new(dice_grid)
(0..3).each {|n| p boggle_board.get_row(n).join("")}
(0..3).each {|n| p boggle_board.get_col(n).join("")}


# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE
# create driver test code to retrieve a value at a coordinate here:


# implement tests for each of the methods here:
# Adapted from the previous implementation
puts boggle_board.create_word([2,1], [1,1], [1,2], [0,3]) == "code"
puts boggle_board.create_word([0,1], [0,2], [1,2]) == "rad"
p boggle_board.get_row(1) == ['i', 'o', 'd', 't']
p boggle_board.get_col(2) == ["a", "d", "l", "k"]
p boggle_board.get_letter(3,2) == "k"
p boggle_board.get_diagonal([0,0], [3,3]) == "bole"
p boggle_board.get_diagonal([3,1], [1,3]) == "alt"
p boggle_board.get_diagonal([0,3], [1,2]) == "ed"
p boggle_board.get_diagonal([3,3], [1,1]) == "elo"

# 5. Reflection 