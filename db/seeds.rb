require 'faker' 
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "seeding"
jesse = Barber.create(name: "Jesse", email: "jdb@yahoo.com", password: "test12345", bio: "I have cut hair for 21 years")
tim = Barber.create(name: "Tim", email: "tim@yahoo.com", password: "test123456", bio: "Been cutting hair longer than Jesse")
jason = Customer.create(name: "jason", email: "jason@yahoo.com", password: "something")

10.times do 
    Product.create(
    name: Faker::Commerce.product_name, 
    description: Faker::Lorem.paragraph
    )
end

Appointment.create(
    appointment_time: DateTime.current,
    barber: jesse,
    customer: jason
)

5.times do 
Appointment.create(
    appointment_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default),
    barber: jesse,
    customer: jason
    
)
end 
puts "done seeding"
