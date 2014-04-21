# U2.W5: Virus Predictor

# I worked on this challenge by myself (cjcjameson).

# EXPLANATION OF require_relative
# require_relative tells the code it should look for a file in the same directory
# and draw on it in this code. It's used here in the driver code only,
# because VirusPredictor works independent of any certain dataset.

# 3. In the state_data file, it's a hash of hashes. Each State is a hash of datapoints, kind of like an object literal.
  # but there's nothing binding them together--they could be completely different collections
#
require_relative 'state_data'

#I considered refactoring the density methods by having a separate file for density_death_table, but that was not an improvement (until we learn SQL!)
#require_relative 'density_death_table'

class VirusPredictor

  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end #This sets up an instance of the VirusPredictor for a certain state, taking inputs
      # based on the necessary data.

  def virus_effects  #This collects the instance variables that were initialized and passes them into specific calculations.
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
      speed = 0.5
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
      speed = 1
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
      speed = 1.5
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
      speed = 2
    else 
      number_of_deaths = (@population * 0.05).floor
      speed = 2.5
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"
    puts " and will spread across the state in #{speed} months.\n\n"
    #refactored, it's just calling the private method. So we don't need this wrapper at all. So I'm ditching it.
  end #it then recollects the effects as a public method
  # However: instance variables for objects are available to private methods, so we don't need to specifically pass them. The class methods can see them.

  # private  #what is this? this makes the subsequent methods not callable directly by an object
  # #what happens if it were cut and pasted above the virus_effects method? Then the virus predictor would never do anything except initialize
  # # The driver code would balk when it called virus_effects.

  # def predicted_mortality #this calculates and prints the death-toll. Refactored, it also spits out the speed.
  #   if @population_density >= 200
  #     number_of_deaths = (@population * 0.4).floor
  #     speed = 0.5
  #   elsif @population_density >= 150
  #     number_of_deaths = (@population * 0.3).floor
  #     speed = 1
  #   elsif @population_density >= 100
  #     number_of_deaths = (@population * 0.2).floor
  #     speed = 1.5
  #   elsif @population_density >= 50
  #     number_of_deaths = (@population * 0.1).floor
  #     speed = 2
  #   else 
  #     number_of_deaths = (@population * 0.05).floor
  #     speed = 2.5
  #   end

  #   print "#{@state} will lose #{number_of_deaths} people in this outbreak"
  #   puts " and will spread across the state in #{speed} months.\n\n"
  # end

# This whole method can be collapsed into one predictor method because both have the same density threshold logic.
  # def speed_of_spread #in months, this calculates and prints how quickly it spreads
  #   speed = 0.0 #this addition method is redundant & not necessary.

  #   if @population_density >= 200
  #     speed += 0.5
  #   elsif @population_density >= 150
  #     speed += 1
  #   elsif @population_density >= 100
  #     speed += 1.5
  #   elsif @population_density >= 50
  #     speed += 2
  #   else 
  #     speed += 2.5
  #   end

  #   puts " and will spread across the state in #{speed} months.\n\n"

  # end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

STATE_DATA.each { |state, data|
  state_report = VirusPredictor.new(state, data[:population_density], data[:population], data[:region], data[:regional_spread])
  puts "The state's population is " + data[:population].to_s #bonus question!
  state_report.virus_effects
}

# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population], STATE_DATA["Alabama"][:region], STATE_DATA["Alabama"][:regional_spread]) 
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population], STATE_DATA["New Jersey"][:region], STATE_DATA["New Jersey"][:regional_spread]) 
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population], STATE_DATA["California"][:region], STATE_DATA["California"][:regional_spread]) 
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population], STATE_DATA["Alaska"][:region], STATE_DATA["Alaska"][:regional_spread]) 
# alaska.virus_effects

# Reflection

# Cool project to work on, it was good that I was able to work on it part of the way
# then put it down when I got stuck, and then when I picked it up the next day, make more progress and finish it off
# I could see how this would work more elegantly in a greater project structure with SQL queries etc. but it's good to know
# how this works in raw Ruby too.