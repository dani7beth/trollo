# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Lets create a couple of users for our database
user = User.create(email: 'test@test.com', password: '123456')
# #lets create a couple of fake boards for our user to have
5.times do
board = Board.create(
    name: Faker::Dessert.variety,
    user_id: user.id
)
    num_lists = rand(1..4)
    num_lists.times do 
       list = board.lists.create(name: Faker::Dessert.flavor)
        num_tasks = rand(1..10)
        num_tasks.times do |i|
           list.tasks.create(task_name: Faker::Dessert.topping, detail: Faker::Hipster.sentence, position: i) 
        end
    end
end



