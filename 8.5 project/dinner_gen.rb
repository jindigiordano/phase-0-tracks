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

#test driver code

add_entree(db, "Honey BBQ Ribs", Faker::Name.name, "false")

# add veggie fn
def add_entree(db, name, submitted_by, favorite)
	db.execute("INSERT INTO entree (name, submitted_by, favorite) values (?, ?, ?)", [name, submitted_by, favorite])
end

add_veggie(db, "Bacon Green Beans", Faker::Name.name, "false")

# add fruit fn
def add_entree(db, name, submitted_by, favorite)
	db.execute("INSERT INTO entree (name, submitted_by, favorite) values (?, ?, ?)", [name, submitted_by, favorite])
end

add_fruit(db, "White Nectarine", Faker::Name.name, "false")


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

# Generate random dinner
# Randomly select from eeach table using rand and id

# View all dishes
# Iterate and print all items in each table

# Add a dish to database
# prompt for what kind of dish
# add to appropriate table

# Add a dish to favorites
# Ask what type of dish
# Print all and ask for id of which to add to fav
# chage fav value to true
# print all fav dishes

#exit
# farewell message