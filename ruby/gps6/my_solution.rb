# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# Require_relative looks for a file within its same directory that you are using for the given file. #
# Require takes a longer path, require is also used to pull in modules. #
require_relative 'state_data'
require 'pry'

class VirusPredictor
# Makes a new state instance. #
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end
# Consolidates the two methods and has them evaluate virus effects #
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

# Number of deaths is based on population density, outputs number of deaths for the population. #
  def predicted_deaths
    # predicted deaths is solely based on population density
    if @population_density >= 200
      death_rate = 0.4
    elsif @population_density >= 150
      death_rate = 0.3
    elsif @population_density >= 100
      death_rate = 0.2
    elsif @population_density >= 50
      death_rate = 0.1
    else
      death_rate = 0.05
    end

    print "#{@state} will lose #{(@population * death_rate).floor} people in this outbreak"

  end

# Calculates how much time in months it will take for disease to spread across the state #
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.

    if @population_density >= 200
      speed = 0.5
    elsif @population_density >= 150
      speed = 1
    elsif @population_density >= 100
      speed = 1.5
    elsif @population_density >= 50
      speed = 2
    else
      speed = 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects

STATE_DATA.each { |state_name, pop_hash|
  #binding.pry
  VirusPredictor.new(state_name, pop_hash[:population_density], pop_hash[:population]).virus_effects
}


#=======================================================================
# Reflection Section

# What are the differences between the two different hash syntaxes shown in the state_data file?
  # One is bracket notation with a string and => to indicate a key, the other is symbol where the key is indicated with a colon

# What does require_relative do? How is it different from require?
  # Require relative accesses a file from where it is in relation to the accessor file, require accesses from the absolute path

# What are some ways to iterate through a hash?
  # You can iterate with the .each method, or by using a for loop with a condition based on the hash length, or a while loop with a condition checking to see if the hash is not empty

# When refactoring virus_effects, what stood out to you about the variables, if anything?
  # That they were all instance variables so they didn't need to be passed to other instance methods

# What concept did you most solidify in this challenge?
  # That you don't always need parameters while passing instance arguments and methods around inside of a class. Also how to loop for nested hashes in ruby and create new objects without assigning them to variables.