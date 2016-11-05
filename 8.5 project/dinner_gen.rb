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

add_entree(db, "Honey BBQ Ribs", Faker::Name.name, false)

# add veggie fn

# add fruit fn

# add dishes to dish table
# db.execute("INSERT INTO dish (name, dish_type) values ('Honey BBQ Ribs', 'entree')")

# add meals to meal table
# db.execute("INSERT INTO meal (name, entree_id, side_id, dessert_id) values ('Murica', 1, 2, 3)")

# add dinners
# db.execute("INSERT INTO dinner (date, host, num_ppl, meal_id) values (?, ?, ?, ?)")

# create lots of dinners

def create_dinner(db, days_ago, invite, num_ppl, meal_id)
	db.execute("INSERT INTO dinner (day_of_week, invite, num_ppl, meal_id) values (?, ?, ?, ?)", [days_ago, invite, num_ppl, meal_id])
end


# explore ORM by retreving data
dinner = db.execute("SELECT * FROM dinner")
p dinner;
# dinner.each do |dinner|
# 	puts "On day #{dinner['day_of_week']} of this week, I suggest cooking #{dinner['meal_id']} for #{dinner['num_ppl']} people and inviting #{dinner['invite']}."
# end


