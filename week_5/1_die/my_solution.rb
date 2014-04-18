# U2.W5: Die Class 1: Numeric


# I worked on this challenge by myself.

# 2. Pseudocode

# Input: object creation call specifying how many sides
# Output: two available calls, to ask how many sides it has, or roll the dice
# Steps: Check during initialization that the die is valid


# 3. Initial Solution

class Die
  def initialize(sides)
    
    if sides <= 0
    	raise ArgumentError.new("Must have a positive number of sides on the die")
    end
    @sides = sides

  end
  
  def sides
    return @sides
  end
  
  def roll
    return rand(sides)+1
  end
end



# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE
test_die = Die.new(6)
p test_die.sides == 6
p test_die.roll <= 6 && test_die.roll > 0
p test_die.roll <= 6 && test_die.roll > 0
p test_die.roll <= 6 && test_die.roll > 0
p test_die.sides > 0




# 5. Reflection 

# I'm still getting comfortable with the @ notation within classes. I struggled
# for a long time with an infinite loop call, and it was because sides was calling
# sides was calling sides...haha. Good google searching eventually helped me out 
# and I learned a bit about recursion in ruby too.