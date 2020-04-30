# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.all.destroy_all
Joke.all.destroy_all

categories = Category.create([{ name: 'Pun' }, { name: 'Knock Knock' }, { name: 'Coronavirus'}, { name: 'Political'}, { name: 'Dad'}])
chicken = Category.create(name: "Chicken")
doctor = Category.create(name: "Doctor Doctor")

chicken_joke = Joke.create(
  lead_up: "Why did the chicken cross the road?", 
  punchline: "To get to the other side!",
  funniness: 3,
  claire_laugh: false,
  category: chicken)

  curtains = Joke.create(
  lead_up: "Doctor Doctor, I feel like a pair of curtains!", 
  punchline: "Pull yourself together!",
  funniness: 6,
  claire_laugh: true,
  category: doctor)

