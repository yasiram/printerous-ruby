# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding..."
User.create(name: 'Super Admin', email: 'superadmin@mail.com', password: '12345678', role: 'Super Admin')
User.create(name: 'Admin', email: 'admin@mail.com', password: '12345678', role: 'Admin')
User.create(name: 'Maya Ratna', email: 'maya@mail.com', password: '12345678', role: 'Account Manager')
puts "Seeding done."