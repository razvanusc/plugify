# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
  Artist.create(
    name: Faker::Music::RockBand.name,
    bio: Faker::Music::UmphreysMcgee.song,
    genre: Faker::Music::Phish.song,
    price_per_hour: 5
  )
end
