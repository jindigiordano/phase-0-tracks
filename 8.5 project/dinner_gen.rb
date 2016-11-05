# Dinner Generator
# Generates dinner idea with main course, veggies, and fruit

# Object Relational Mapping (ORM)
# Converting db to object

# require gems
require 'sqlite3'
require 'faker'

# Create database
db = SQLite3::Database.new("dinner.db")
db.results_as_hash = true

# Fancy string delimiters
# Don't have to use double or single quotes
# Same word at beginning and end, caps
# create tables if not already exist

create_entree_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS entree(
		id INTEGER PRIMARY KEY,
		name VARCHAR(255),
		submitted_by VARCHAR(255),
		favorite BOOLEAN
	)
SQL
create_veggie_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS veggie(
		id INTEGER PRIMARY KEY,
		name VARCHAR(255),
		submitted_by VARCHAR(255),
		favorite BOOLEAN
	)
SQL
create_fruit_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS fruit(
		id INTEGER PRIMARY KEY,
		name VARCHAR(255),
		submitted_by VARCHAR(255),
		favorite BOOLEAN
	)
SQL


# create tables
db.execute(create_entree_table_cmd)
db.execute(create_veggie_table_cmd)
db.execute(create_fruit_table_cmd)

# add entree fn
def add_entree(db, name, submitted_by, favorite)
	db.execute("INSERT INTO entree (name, submitted_by, favorite) values (?, ?, ?)", [name, submitted_by, favorite])
end

entree = db.execute("SELECT * FROM entree")
# if entree table is empty, put some initial values in it
if entree == []
	add_entree(db, "Honey BBQ Ribs", Faker::Name.name, "false")
end


# add veggie fn
def add_veggie(db, name, submitted_by, favorite)
	db.execute("INSERT INTO veggie (name, submitted_by, favorite) values (?, ?, ?)", [name, submitted_by, favorite])
end

veggie = db.execute("SELECT * FROM veggie")
if veggie == []
	add_veggie(db, "Bacon Green Beans", Faker::Name.name, "false")
end


# add fruit fn
def add_fruit(db, name, submitted_by, favorite)
	db.execute("INSERT INTO fruit (name, submitted_by, favorite) values (?, ?, ?)", [name, submitted_by, favorite])
end
fruit = db.execute("SELECT * FROM fruit")
if fruit == []
	add_fruit(db, "White Nectarine", Faker::Name.name, "false")
end

# def create_dinner(db, days_ago, invite, num_ppl, meal_id)
#	db.execute("INSERT INTO dinner (day_of_week, invite, num_ppl, meal_id) values (?, ?, ?, ?)", [days_ago, invite, num_ppl, meal_id])
# end


# explore ORM by retreving data
# dinner = db.execute("SELECT * FROM dinner")
# p dinner;
# dinner.each do |dinner|
# 	puts "On day #{dinner['day_of_week']} of this week, I suggest cooking #{dinner['meal_id']} for #{dinner['num_ppl']} people and inviting #{dinner['invite']}."
# end


# Prompt user if they'd like to add a dish or be recommended a meal
puts "Welcome to the dinner generator."
puts "Select one of the following options:"
puts "1 - Generate a random dinner idea for me"
puts "2 - View all dishes"
puts "3 - Add a dish to the database"
puts "4 - Add a dish to favorites"
puts "5 - exit"

selection = gets.chomp

case selection

when "1"
	# Generate random dinner
	# Randomly select from each table using rand and id
	puts "Here is your randomly generated dinner:"
	# random entree
	entree_id = rand(entree.length)
	puts "Entree: #{entree[entree_id]['name']}"
	veggie_id = rand(veggie.length)
	puts "Veggie: #{veggie[veggie_id]['name']}"
	fruit_id = rand(fruit.length)
	puts "Fruit: #{fruit[fruit_id]['name']}"

when "2"
	# View all dishes
	# Iterate and print all items in each table
	entree = db.execute("SELECT * FROM entree")
	puts "ENTREES:"
	entree.each do |entree|
	 	puts "#{entree['id']} #{entree['name']}"
	end

	veggie = db.execute("SELECT * FROM veggie")
	puts "VEGGIES:"
	veggie.each do |veggie|
	 	puts "#{veggie['id']} #{veggie['name']}"
	end

	fruit = db.execute("SELECT * FROM fruit")
	puts "FRUIT:"
	fruit.each do |fruit|
	 	puts "#{fruit['id']} #{fruit['name']}"
	end

when "3"
# Add a dish to database
# prompt for what kind of dish
# add to appropriate table

when "4"
# Add a dish to favorites
# Ask what type of dish
# Print all and ask for id of which to add to fav
# chage fav value to true
# print all fav dishes

when "5"
#exit
# farewell message

end