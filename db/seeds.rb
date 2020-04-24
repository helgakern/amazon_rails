# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.destroy_all
Product.destroy_all

1000.times do 
    p = Product.create({
        title: Faker::Hacker.noun,
        description: Faker::Hacker.say_something_smart,
        price: Faker::Commerce.price
    })
    if p.valid? 
        rand(0..10).times.each do
            Review.create(
                rating: Faker::Number.between(from:1, to:5),
                body: Faker::Hipster.paragraph,
                product: p 
            )
        end
    end
end

puts "Created #{Product.count} products"
puts "Created #{Review.count} reviews"