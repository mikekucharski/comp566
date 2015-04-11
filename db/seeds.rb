# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

mike = User.create!(
						first_name: 'Mike',
						last_name: 'Kucharski',
						email: 'mike@gmail.com',
						password: 'foobar',
						password_confirmation: 'foobar',
						balance: 500)

# Seed brands
Chocolate = Brand.create!(name: "Chocolate")
Girl = Brand.create!(name: "Girl")
Baker = Brand.create!(name: "Baker")
Element = Brand.create!(name: "Element")
# Seed Skateboard Categories
Decks = Category.create!(name: "decks", shop_type: "Skateboards")
Trucks = Category.create!(name: "trucks", shop_type: "Skateboards")
Wheels = Category.create!(name: "wheels", shop_type: "Skateboards")
# Seed Clothing Categories
Shirts = Category.create!(name: "shirts", shop_type: "Clothing")
Pants = Category.create!(name: "pants", shop_type: "Clothing")
Shoes = Category.create!(name: "shoes", shop_type: "Clothing")

# SEED CHOCOLATE DATA
choc_decks1 = Product.create!(title: "Chocolate Berle Floater Deck", 
														 imageNum: "1", 
														 brand: Chocolate, 
														 category: Decks, 
														 price: (rand(20...50).to_f + 0.99))
choc_deck2 = Product.create!(title: "Chocolate Johnson Matte Sketch Deck", 
														 imageNum: "2", 
														 brand: Chocolate, 
														 category: Decks, 
														 price: (rand(20...50).to_f + 0.99))
choc_trucks1 = Product.create!(title: "Royal Chocolate Trucks", 
															 imageNum: "1", 
															 brand: Chocolate, 
															 category: Trucks, 
															 price: (rand(20...50).to_f + 0.99))
choc_wheels1 = Product.create!(title: "Chocolate Chunk Classic Wheels",
														 	 imageNum: "1", 
														 	 brand: Chocolate, 
														 	 category: Wheels, 
														 	 price: (rand(20...50).to_f + 0.99))
choc_shirts1 = Product.create!(title: "Chocolate Red Square T-Shirt", 
															 imageNum: "1", 
															 brand: Chocolate, 
															 category: Shirts, 
															 price: (rand(20...50).to_f + 0.99))
choc_pants1 = Product.create!(title: "Tan Khaki Pants", 
															 imageNum: "1", 
															 brand: Chocolate, 
															 category: Pants, 
															 price: (rand(20...50).to_f + 0.99))
choc_shoes1 = Product.create!(title: "Chocolate Osiris Shoes", 
															 imageNum: "1", 
															 brand: Chocolate, 
															 category: Shoes, 
															 price: (rand(20...50).to_f + 0.99))

# SEED BAKER DATA
baker_decks1 = Product.create!(title: "Baker Brand Logo White Deck", 
														 imageNum: "1", 
														 brand: Baker, 
														 category: Decks, 
														 price: (rand(20...50).to_f + 0.99))
baker_trucks1 = Product.create!(title: "Thunder Trucks", 
															 imageNum: "1", 
															 brand: Baker, 
															 category: Trucks, 
															 price: (rand(20...50).to_f + 0.99))
baker_wheels1 = Product.create!(title: "Baker Pit Stop Wheels",
														 	 imageNum: "1", 
														 	 brand: Baker, 
														 	 category: Wheels, 
														 	 price: (rand(20...50).to_f + 0.99))
baker_shirts1 = Product.create!(title: "Baker Ice Pack T-Shirt", 
															 imageNum: "1", 
															 brand: Baker, 
															 category: Shirts, 
															 price: (rand(20...50).to_f + 0.99))
baker_pants1 = Product.create!(title: "Casual Black Pants", 
															 imageNum: "1", 
															 brand: Baker, 
															 category: Pants, 
															 price: (rand(20...50).to_f + 0.99))
baker_shoes1 = Product.create!(title: "Baker Vans", 
															 imageNum: "1", 
															 brand: Baker, 
															 category: Shoes, 
															 price: (rand(20...50).to_f + 0.99))

# SEED ELEMENT DATA
element_decks1 = Product.create!(title: "Element Appleyard Island Time Deck", 
														 imageNum: "1", 
														 brand: Element, 
														 category: Decks, 
														 price: (rand(20...50).to_f + 0.99))
element_trucks1 = Product.create!(title: "Purple City Trucks", 
															 imageNum: "1", 
															 brand: Element, 
															 category: Trucks, 
															 price: (rand(20...50).to_f + 0.99))
element_wheels1 = Product.create!(title: "Element Section Wheels",
														 	 imageNum: "1", 
														 	 brand: Element, 
														 	 category: Wheels, 
														 	 price: (rand(20...50).to_f + 0.99))
element_shirts1 = Product.create!(title: "Element Pennant T-Shirt", 
															 imageNum: "1", 
															 brand: Element, 
															 category: Shirts, 
															 price: (rand(20...50).to_f + 0.99))
element_pants1 = Product.create!(title: "Element Howland by Jeremy Fish Chino Pants", 
															 imageNum: "1",
															 brand: Element, 
															 category: Pants, 
															 price: (rand(20...50).to_f + 0.99))
element_shoes1 = Product.create!(title: "Element Heart Shoes", 
															 imageNum: "1", 
															 brand: Element, 
															 category: Shoes, 
															 price: (rand(20...50).to_f + 0.99))

# SEED GIRL DATA
girl_decks1 = Product.create!(title: "Girl McCrank Advertype Deck", 
														 imageNum: "1", 
														 brand: Girl, 
														 category: Decks, 
														 price: (rand(20...50).to_f + 0.99))
girl_trucks1 = Product.create!(title: "Royal Girl Trucks", 
															 imageNum: "1", 
															 brand: Girl, 
															 category: Trucks, 
															 price: (rand(20...50).to_f + 0.99))
girl_wheels1 = Product.create!(title: "Girl Spike It Wheels",
														 	 imageNum: "1", 
														 	 brand: Girl, 
														 	 category: Wheels, 
														 	 price: (rand(20...50).to_f + 0.99))
girl_shirts1 = Product.create!(title: "Big Girl T-Shirt", 
															 imageNum: "1", 
															 brand: Girl, 
															 category: Shirts, 
															 price: (rand(20...50).to_f + 0.99))
girl_pants1 = Product.create!(title: "Grey Pants", 
															 imageNum: "1", 
															 brand: Girl, 
															 category: Pants, 
															 price: (rand(20...50).to_f + 0.99))
girl_shoes1 = Product.create!(title: "Classic Grey Shoes", 
															 imageNum: "1", 
															 brand: Girl, 
															 category: Shoes, 
															 price: (rand(20...50).to_f + 0.99))

o1 = mike.orders.create!()
od = o1.order_products.create!({product: choc_decks1, quantity: 5})