# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Lets create a couple of users for our database
3.times do
    password = Faker::Internet.password(min_length: 6, max_length: 10)
    user = User.create(
        email: Faker::Internet.email,
        password: password,
        password_confirmation: password
    )
end
#lets create a couple of fake boards for our user to have
5.times do
Board.create(
    name: Faker::Dessert.variety,
    user_id: rand(1...4) #ruby doesnt include the last number so to include 3 i put 4
)
end



