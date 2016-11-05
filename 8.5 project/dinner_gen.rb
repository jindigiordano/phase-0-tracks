# Dinner Generator
# Generates dinner idea with main course, veggies, and fruit

# require gems
require 'sqlite3'
require 'faker'

# Create database
db = SQLite3::Database.new("dinner.db")
db.results_as_hash = true

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
	add_entree(db, "Honey BBQ Ribs", Faker::Name.name, "true")
	add_entree(db, "Pancotto alla Lucchese", Faker::Name.name, "false")
	add_entree(db, "Linguine in White Clam Sauce", Faker::Name.name, "true")
end


# add veggie fn
def add_veggie(db, name, submitted_by, favorite)
	db.execute("INSERT INTO veggie (name, submitted_by, favorite) values (?, ?, ?)", [name, submitted_by, favorite])
end

veggie = db.execute("SELECT * FROM veggie")
if veggie == []
	add_veggie(db, "Bacon Green Beans", Faker::Name.name, "false")
	add_veggie(db, "Romaine Salad w/ Ranch & Bacon", Faker::Name.name, "true")
	add_veggie(db, "Cran-Walnut Spinach Salad", Faker::Name.name, "false")
end


# add fruit fn
def add_fruit(db, name, submitted_by, favorite)
	db.execute("INSERT INTO fruit (name, submitted_by, favorite) values (?, ?, ?)", [name, submitted_by, favorite])
end
fruit = db.execute("SELECT * FROM fruit")
if fruit == []
	add_fruit(db, "White Nectarine", Faker::Name.name, "true")
	add_fruit(db, "Gala Apple", Faker::Name.name, "false")
	add_fruit(db, "Cutie Tangerine", Faker::Name.name, "false")
end

# fn to print all items
def print_all(db)
	entree = db.execute("SELECT * FROM entree")
	puts "ENTREES:"
	entree.each do |entree|
	 	puts "#{entree['id']} - #{entree['name']} (Submitted by: #{entree['submitted_by']}) Fav=#{entree['favorite']}"
	end

	veggie = db.execute("SELECT * FROM veggie")
	puts "VEGGIES:"
	veggie.each do |veggie|
	 	puts "#{veggie['id']} - #{veggie['name']} (Submitted by: #{veggie['submitted_by']}) Fav=#{veggie['favorite']}"
	end

	fruit = db.execute("SELECT * FROM fruit")
	puts "FRUIT:"
	fruit.each do |fruit|
	 	puts "#{fruit['id']} - #{fruit['name']} (Submitted by: #{fruit['submitted_by']}) Fav=#{fruit['favorite']}"
	end
end

# Prompt user if they'd like to add a dish or be recommended a meal
selection = ""
until selection == "6"
	puts "------------------------------------------"
	puts "Welcome to the dinner generator."
	puts "Select one of the following options:"
	puts "1 - Generate a random dinner idea for me"
	puts "2 - View all dishes"
	puts "3 - Add a dish to the database"
	puts "4 - View favorites"
	puts "5 - Update dish/Add to favorites"
	puts "6 - Exit"
	puts "------------------------------------------"

	selection = gets.chomp

	case selection
	when "1"
		# Generate random dinner
		# Randomly select from each table using rand and id
		puts "Here is your randomly generated dinner:"
		# random entree
		entree = db.execute("SELECT * FROM entree")
		entree_id = rand(entree.length.floor + 1)
		puts "Entree: #{entree[entree_id]['name']}"
		veggie = db.execute("SELECT * FROM veggie")
		veggie_id = rand(veggie.length)
		puts "Veggie: #{veggie[veggie_id]['name']}"
		fruit = db.execute("SELECT * FROM fruit")
		fruit_id = rand(fruit.length)
		puts "Fruit: #{fruit[fruit_id]['name']}"

	when "2"
		# View all dishes
		print_all(db)

	when "3"
		# Add a dish to database
		puts "Enter the name of the dish."
		dish_name = gets.chomp
		puts "Enter your name (will go under 'submitted by')"
		dish_submitter = gets.chomp
		puts "Is this dish a favorite of yours? (y/n)"
		dish_fav = gets.chomp
		if dish_fav == "y"
			fav_bool = "true"
		else
			fav_bool = "false"
		end
		# prompt for what kind of dish
		puts "Is this dish an entree, veggie, or fruit?"
		dish_type = gets.chomp

		case dish_type.downcase
		# add to appropriate table
		when "entree"
			add_entree(db, dish_name, dish_submitter, fav_bool)
			puts "Thank you, your entree has been added!"
			updated_item = db.execute("SELECT * FROM entree WHERE id=#{entree.length + 1}")
			puts "#{updated_item[0]['id']} - #{updated_item[0]['name']} (Submitted by: #{updated_item[0]['submitted_by']}) Fav=#{updated_item[0]['favorite']}"

		when "veggie"
			add_veggie(db, dish_name, dish_submitter, fav_bool)
			puts "Thank you, your veggie has been added!"
			updated_item = db.execute("SELECT * FROM veggie WHERE id=#{veggie.length + 1}")
			puts "#{updated_item[0]['id']} - #{updated_item[0]['name']} (Submitted by: #{updated_item[0]['submitted_by']}) Fav=#{updated_item[0]['favorite']}"

		when "fruit"		
			add_fruit(db, dish_name, dish_submitter, fav_bool)
			puts "Thank you, your fruit has been added!"
			updated_item = db.execute("SELECT * FROM fruit WHERE id=#{fruit.length + 1}")
			puts "#{updated_item[0]['id']} - #{updated_item[0]['name']} (Submitted by: #{updated_item[0]['submitted_by']}) Fav=#{updated_item[0]['favorite']}"

		end

	when "4"
	# Display all favorites
	# Iterate and print all items in each table with fav = true
		fav_entree = db.execute("SELECT * FROM entree WHERE entree.favorite == 'true'")
		puts "ENTREES:"
		fav_entree.each do |entree|
		 	puts "#{entree['id']} #{entree['name']}"
		end

		fav_veggie = db.execute("SELECT * FROM veggie WHERE veggie.favorite == 'true'")
		puts "VEGGIES:"
		fav_veggie.each do |veggie|
		 	puts "#{veggie['id']} #{veggie['name']}"
		end

		fav_fruit = db.execute("SELECT * FROM fruit WHERE fruit.favorite == 'true'")
		puts "FRUIT:"
		fav_fruit.each do |fruit|
		 	puts "#{fruit['id']} #{fruit['name']}"
		end

	when "5"
		# Update and/or Add a dish to favorites
		# Print all and ask for id of which to add to change
		puts "Here's the dishes we have so far:"
		print_all(db)
		puts "Enter the type of dish you'd like to change (entree/veggie/fruit)"
		dish_type = gets.chomp.downcase
		puts "Enter the dish ID (integer)"
		dish_id = gets.chomp.to_i
		puts "What field would you like to change? (name/submitted_by/favorite)"
		field_change = gets.chomp
		puts "Enter what we should change the field to."
		new_field = gets.chomp
		db.execute("UPDATE #{dish_type} SET #{field_change}='#{new_field}' WHERE id=#{dish_id}")
		puts "Thanks! Here's the updated item:"
		updated_item = db.execute("SELECT * FROM #{dish_type} WHERE id=#{dish_id}")
		puts "#{updated_item[0]['id']} - #{updated_item[0]['name']}, Submitted by: #{updated_item[0]['submitted_by']}, Fav?: #{updated_item[0]['favorite']}"
	when "6"
		puts "Thanks, happy eating!"
	end
end