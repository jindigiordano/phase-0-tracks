continents = {
	'antarctica' => {
		'cities' => [],
		'animals' => ['penguins', 'polar bears', 'whales'],
		'countries' => 0
	},
	'north_america' => {
		'cities' => ['Mexico City', 'New York City', 'Toronto'],
		'animals' => ['deer', 'seagulls', 'alligators'],
		'countries' => 23
	},
	'asia' => {
		'cities' => ['Bangkok', 'Tokyo', 'Shanghai'],
		'animals' => ['Pandas', 'Koi', 'Elephants'],
		'countries' => 48
	},
	'planet' => 'Earth',
	'how_many' => 7,
	'not_listed' => ['South America', 'Africa', 'Europe', 'Australia']
}

sw_movies = [
	{   'title' => 'a_new_hope', 
		'release' => 1977,
		'protagonist' => 'Luke Skywalker',
		'episode' => 4
	},
	{	'title' => 'the_empire_strikes_back',
		'release' => 1980,
		'villain' => 'Darth Vader',
		'episode' => 5
	},
	{	'title' => 'return_of_the_jedi',
		'release' => 1983,
		'evil_hutt' => "Jabba",
		'episode' => 6
	},
	['The Phantom Menace', 'Attack of the Clones', 'Revenge of the Sith'],
	['The Clone Wars Animated', ['The Clone Wars Movie', 'The Clone Wars TV Show']],
	'The Force Awakens'
]

p continents['antarctica']['animals'][0]

p continents['north_america']['cities']

p continents['asia']['countries']

p continents['not_listed'][1]

p sw_movies[0]['release']
p sw_movies[1]['villain']
p sw_movies[2]['episode']
p sw_movies[3]
p sw_movies[4][1][1]