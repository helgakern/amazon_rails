# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Product.delete_all
NUM_PRODUCT = 1000

NUM_PRODUCT.times do 
    created_at = Faker::Date.backward(days: 365 * 5)
    Product.create(
        title: Faker::Device.model_name,
        description: Faker::Device.manufacturer,
        price: Faker::Number.decimal(l_digits: 2)
        
    )
end

product = Product.all 

puts Cowsay.say("Generated #{product.count} products", :dragon)