# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge [with: C.J. Jameson, Clark Hinchcliff], 

boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


# Part 1: Access multiple elements of a nested array

# Pseudocode

# Initial Solution

def create_word(board, *coords)
  coords.map { |coord| board[coord.first][coord.last]}.join("")
end

# Refactored Solution
# Refactored Solution
# we did this just to show the code and understand what it's doing, but the above/previous method
# actually seems better, more elegant, compact etc.

#def create_word(board, *coords)
# output_str = ""
# coords.map do |coord|
#     output_str << board[coord.first][coord.last]
#  end
#  return output_str
#end


# DRIVER TESTS GO BELOW THIS LINE
puts create_word(boggle_board, [2,1], [1,1], [1,2], [0,3]) == "code" #=> returns "code"  
puts create_word(boggle_board, [0,1], [0,2], [1,2]) == "rad" #=> creates what california slang word? "rad", man.

# Reflection 

#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode
#    define a fuction that takes a board and a row as its arguments
#    return the row'th element of the board


# Initial Solution
# we contemplated putting board[row - 1] as our returned value in case the person putting the row in didn't understand the way arrays worked, but stayed with this method instead.

def get_row(board, row)
    return board[row]
end

# Refactored Solution


# DRIVER TESTS GO BELOW THIS LINE
simplest = [["a"]]
p get_row(simplest, 0) == ["a"]
p get_row(boggle_board, 1) == ['i', 'o', 'd', 't']

# Reflection 



#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the elements in the column.

# Pseudocode
# we will define a method named get_col that takes a board and a column as its arguments
# we will map through the two dimensional array in a loop
# in the map function we will stop through each row and only grab the column'th item

# Initial Solution

def get_col(board, column)
   board.map {|row| row[column]}
end

# Refactored Solution
def get_col(board, column)
   board.map do |row|
       row[column]
   end
end

# DRIVER TESTS GO BELOW THIS LINE

p get_col(simplest, 0) == ["a"]
p get_col(boggle_board, 2) == ["a", "d", "l", "k"]