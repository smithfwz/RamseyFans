# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Dish.destroy_all

Dish.create!(title: 'chickend rice', description: 'this dish is very tasty', cost: 123)
Dish.create!(title: 'soup', description: 'this is the food no fat', cost: 22)