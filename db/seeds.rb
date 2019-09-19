# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial5.org"
    password = 'Password12!'

    User.create!(name: name, username:"user#{n+1}", password:password, email:email)
end