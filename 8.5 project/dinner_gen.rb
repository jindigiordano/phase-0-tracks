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
create_table_cmd = <<-SQL
	CREATE TABLE IF NOT EXISTS dinner(
		id INTEGER PRIMARY KEY,
		ingredient VARCHAR(255),
		quantity INT
	)
SQL


# create a dinner table if not already there
db.execute(create_table_cmd)

# add a test dinner
# db.execute("INSERT INTO dinner (ingredient, quantity) values ('tomatoes', 2)")

# create lots of dinners

def create_dinner(db, ingredient, quantity)
	db.execute("INSERT INTO dinner (ingredient, quantity) values (?, ?)", [ingredient, quantity])
end

10.times do
	create_dinner(db, Faker::Name.name, 0)
end


# explore ORM by retreving data
dinner = db.execute("SELECT * FROM dinner")
dinner.each do |dinner|
	puts "Use #{dinner['quantity']} #{dinner['ingredient']}"
end