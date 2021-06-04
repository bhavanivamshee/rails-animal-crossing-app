# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Material.destroy_all
Diy.destroy_all
User.destroy_all

Diy.get_data

10.times do
    User.create(
        island_name: Faker::Movies::HarryPotter.location, 
        username: Faker::Movies::HarryPotter.character, 
        email: Faker::Internet.email,
        dream_address: "1234-1234-1234",
        password: "123")
end