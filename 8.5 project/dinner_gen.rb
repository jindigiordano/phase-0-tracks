# Dinner Generator

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
# create a dinner table if not already there

create_dish_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS dish(
		id INTEGER PRIMARY KEY,
		name VARCHAR(255),
		dish_type VARCHAR(255)
	)
SQL
create_meal_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS meal(
		id INTEGER PRIMARY KEY,
		name VARCHAR(255),
		entree_id INT,
		side_id INT,
		dessert_id INT,
		FOREIGN KEY (entree_id) REFERENCES dish(id),
		FOREIGN KEY (side_id) REFERENCES dish(id),
		FOREIGN KEY (dessert_id) REFERENCES dish(id)
	)
SQL
create_dinner_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS dinner(
		id INTEGER PRIMARY KEY,
		day_of_week INT,
		invite VARCHAR(255),
		num_ppl INT,
		meal_id INT,
		FOREIGN KEY (meal_id) REFERENCES meal(id)
	)
SQL

db.execute(create_dish_table_cmd)
db.execute(create_meal_table_cmd)
db.execute(create_dinner_table_cmd)

# add dishes to dish table
db.execute("INSERT INTO dish (name, dish_type) values ('Honey BBQ Ribs', 'entree')")
db.execute("INSERT INTO dish (name, dish_type) values ('Mashed Potatoes', 'side')")
db.execute("INSERT INTO dish (name, dish_type) values ('Peach Cobbler', 'dessert')")
db.execute("INSERT INTO dish (name, dish_type) values ('Char Siu Pork', 'entree')")
db.execute("INSERT INTO dish (name, dish_type) values ('Steamed Rice', 'side')")
db.execute("INSERT INTO dish (name, dish_type) values ('Custard Bun', 'dessert')")
db.execute("INSERT INTO dish (name, dish_type) values ('Clam Pasta', 'entree')")
db.execute("INSERT INTO dish (name, dish_type) values ('Bruschetta', 'side')")
db.execute("INSERT INTO dish (name, dish_type) values ('Gelato', 'dessert')")

# add meals to meal table
db.execute("INSERT INTO meal (name, entree_id, side_id, dessert_id) values ('Murica', 1, 2, 3)")
db.execute("INSERT INTO meal (name, entree_id, side_id, dessert_id) values ('Chinese Deli', 4, 5, 6)")
db.execute("INSERT INTO meal (name, entree_id, side_id, dessert_id) values ('Italian Seaside Summer', 7, 8, 9)")
db.execute("INSERT INTO meal (name, entree_id, side_id, dessert_id) values ('Fusion Dinner', 1, 5, 9)")

# add dinners
# db.execute("INSERT INTO dinner (date, host, num_ppl, meal_id) values (?, ?, ?, ?)")

# create lots of dinners

def create_dinner(db, days_ago, invite, num_ppl, meal_id)
	db.execute("INSERT INTO dinner (day_of_week, invite, num_ppl, meal_id) values (?, ?, ?, ?)", [days_ago, invite, num_ppl, meal_id])
end

# 7.times { |day_of_week|
#	create_dinner(db, (day_of_week + 1), Faker::Name.name, (1 + rand(12)), (1 + rand(4)))
# }


# explore ORM by retreving data
dinner = db.execute("SELECT * FROM dinner")
p dinner;
dinner.each do |dinner|
	puts "On day #{dinner['day_of_week']} of this week, I suggest cooking #{dinner['meal_id']} for #{dinner['num_ppl']} people and inviting #{dinner['invite']}."
end


