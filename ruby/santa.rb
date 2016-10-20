class Santa
	attr_reader :ethnicity, :age
	attr_accessor :gender, :reindeer_ranking

	def speak
		puts "Ho, ho ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookie_type)
		puts "That was a good #{cookie_type}!"
	end

	def initialize(gender, ethnicity)
		puts "Initializing Santa instance..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = Random.new
		@age = @age.rand(141)
	end

	def celebrate_birthday
		@age =+ 1
	end

	def get_mad_at(reindeer_name)
		i = @reindeer_ranking.index(reindeer_name)
		@reindeer_ranking << @reindeer_ranking[i]
		@reindeer_ranking.delete_at(i)
		@reindeer_ranking
	end

end

santas = []

example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", 
	"androgyne", "androgynous", "cis", "cisgender", "gender nonconforming", "genderqueer",
	"intersex", "neither", "non-binary", "pangender", "trans", "trans female", "trans male", "two-spirit", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", 
	"Mystical Creature (unicorn)", "N/A", "asian", "pacific islander", "Hispanic", "mixed race",
	"Aztec", "Eskimo", "Cherokee", "Blackfoot", "Irish", "Scottish", "Norwegian",
	"Korean", "Chinese", "Japanese", "Vietnamese", "Laotian", "Desi", "Persian", 
	"Nigerian", "Kenyan", "Brazilian", "Haitian", "Jamaican", "Mexican","Guatemalan",
	"Australian", "Icelandic", "Danish"]


# create 100 santas
100.times do
  santas << Santa.new(example_genders.sample, example_ethnicities.sample)
end

# p santas

santas.each { |i|
	puts "Santa ##{santas.index(i) + 1}:"
	puts "Age: #{i.age}"
	puts "Gender: #{i.gender}"
	puts "Ethnicity: #{i.ethnicity}"
	puts "Reindeer Ranking: #{i.reindeer_ranking}"
}

# p santas[0].age
# p santas[0].ethnicity
# p santas[0].celebrate_birthday
# p santas[0].get_mad_at("Rudolph")
# santas[0].gender = "Femme Fatale"
# p santas[0].gender