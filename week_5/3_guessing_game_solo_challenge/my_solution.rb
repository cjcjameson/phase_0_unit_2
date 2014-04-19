# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input: Start the game up by taking the top range, and later on accept guesses
# Output: Status of the game: Has the correct answer been found?
# Is a certain guess too high or too low or correct?
# Steps: During initialization, randomly generate the number to be guessed, and set solved to false
# Solved? returns whether it's solved or not
# Guess evaluates the guess, stores it, and returns the outcome.
# Scripting: Get users input, tell them what their guess was, keep going until they
# get it correct, give up, or exit.


# 3. Initial Solution

class GuessingGame
  def initialize(answer)
    @answer = answer
    @solveBool = false
  end
  
  def solved?
  	return @solveBool
  end

  def guess(guess_input)
  	case
  	 when guess_input == @answer && @solveBool
  		p "Indeed, the answer is still " + @answer.to_s
  		return :correct
  	 when guess_input == @answer && !@solveBool
  		p "You got it right! The answer is " + @answer.to_s
  		@solveBool = true
  		return :correct
  	 when guess_input != @answer && @solveBool
  	 	p "What? You got it right before. Now I'll make you solve it all over again"
  	 	@solveBool = false
  	 when guess_input > @answer
  		p "Too high. Your last guess was " + guess_input.to_s + ". Try again!"
  		return :high
  	 when guess_input < @answer
  		p "Too low. Your last guess was " + guess_input.to_s + ". Try again!"
  		return :low
  	 else
  		p "Hm, somthing went wrong"
  	end
  end

  def give_up
  	p "Are you sure? The answer was " + @answer.to_s
  end

  # Make sure you define the other required methods, too
end




# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE

test_game = GuessingGame.new(100)
p test_game.solved? == false
p test_game.guess(101) == :high
p test_game.guess(-1) == :low




# 5. Reflection 

#sweet, got it working without too much trouble; just a little finagling to fit the rspec
# now refactor and add a script portion to it.
