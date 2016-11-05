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

create_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS dish(
		id INTEGER PRIMARY KEY,
		name VARCHAR(255),
		dish_type VARCHAR(255)
	);
	CREATE TABLE IF NOT EXISTS meal(
		id INTEGER PRIMARY KEY,
		name VARCHAR(255),
		entree_id VARCHAR(255),
		side_id VARCHAR(255),
		dessert_id VARCHAR(255),
		FOREIGN KEY (entree_id) REFERENCES dish(id),
		FOREIGN KEY (side_id) REFERENCES dish(id),
		FOREIGN KEY (dessert_id) REFERENCES dish(id)
	);
	CREATE TABLE IF NOT EXISTS dinner(
		id INTEGER PRIMARY KEY,
		date VARCHAR(255),
		host VARCHAR(255),
		num_ppl INT,
		meal_id INT,
		FOREIGN KEY (meal_id) REFERENCES meal(id)
	);
SQL

db.execute(create_table_cmd)

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
db.execute("INSERT INTO dinner (date, host, num_ppl, meal_id) values (?, ?, 4, ?)")

# create lots of dinners

def create_dinner(db, date, host, num_ppl, meal_id)
	db.execute("INSERT INTO dinner (date, host, num_ppl, meal_id) values (?, ?, ?, ?)", [date, host, num_ppl, meal_id])
end

10.times do
	create_dinner(db, Faker::Date.backward(150), Faker::Name.name, 4, (1 + rand(4)))
end


# explore ORM by retreving data
dinner = db.execute("SELECT * FROM dinner")
dinner.each do |dinner|
	puts "#{dinner['host']} cooked #{dinner['meal']} for #{dinner['num_ppl']} on #{dinner['date']}."
end




