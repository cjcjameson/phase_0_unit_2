# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge [by myself, with: ].

# 2. Pseudocode

# Input:
# Output:
# Steps:


# 3. Initial Solution

class Die
  def initialize(sides)
    #Expecting an array
    if sides.length <= 0
    	raise ArgumentError.new("Must have a positive number of sides on the die")
    end
    @sides = sides

  end
  
  def sides
    return @sides.length
  end
  
  def roll
    return @sides[rand(sides)]
  end
end


# 4. Refactored Solution


# I would so re-name various method call names etc. because it's all very confusing
# But it would break the rspec. I'll leave it for now



# 1. DRIVER TESTS GO BELOW THIS LINE

dreidel = Die.new(["hen", "shin", "nun", "gimmel"])
boggle_1 = Die.new(["X", "G", "E", "Qu", "U", "T"])

p dreidel.sides == 4
p boggle_1.sides == 6
p dreidel.roll
p boggle_1.roll


# 5. Reflection 

# the cool / weird thing here is that now when I'm within the roll method, I can call
# sides, and it defaults to being this.sides, rather than the input from above.
# This is more cumbersome than C++, which I'm used to, because you have to have initiator
# code merely to make items available to the rest of the method.
# But!! THis probably encourages staying within the OOP mindset--you're always building
# up an object that should be useful when you're making a class.
# And it's more transparent, so more powerful in what you can do.
