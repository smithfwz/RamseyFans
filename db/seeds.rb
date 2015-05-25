# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Dish.destroy_all

Dish.create!(title: 'Fish and chips', description: "Increased competition means it's not the standout fave it once was but good old fish and chips remains a popular choice. While you probably won't get your cod and chips wrapped in an old copy of The Sun these days, a takeaway from the chippy is still an enjoyable, nostalgic treat for many.", cost: 23, pax: 3, vegetarian: false)
Dish.create!(title: 'Pizza', description: 'High streets chock-full of pizza restaurants and takeaways, plus supermarket brands aplenty, leave us in no doubt that the English love their margheritas and the like. Options cater for all tastes, from thin and crispy through to deep pan with crusts bursting full of garlic and cheese (probably not an authentically Italian creation, that one).', cost: 22, pax: 4, vegetarian: false)
Dish.create!(title: 'Chinese stir-fry', description: 'A recent study by the Food Network U.K. found that one in five Brits now feast on stir-fry at least once a week, enjoying its ease of preparation almost as much as its taste.', cost: 15, pax: 2, vegetarian: true)
Dish.create!(title: 'Chicken tikka masala', description: "This meal of roasted chicken chunks in a spicy sauce has long topped lists of Britain's most popular restaurant dishes, to the extent that it's sometimes referred to as Britain's national dish.", cost: 26, pax: 2, vegetarian: false)
Dish.create!(title: 'Spaghetti bolognese', description: "Though of Italian extraction, spag bol has been adopted as an English staple. Purists say the version so beloved by the English is a very different dish to the one originally created in Bologna, however.", cost: 29, pax: 4, vegetarian: true)