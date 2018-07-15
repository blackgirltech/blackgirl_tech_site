# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Member.create!(email: 'fadmin@example.com', password: 'password', password_confirmation: 'password')
Member.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', first_name: "Damz", last_name: "Amz", admin: true)
Member.create!(email: 'damzcodes@gmail.com', password: 'password', first_name: "Damz", last_name: "Amz", password_confirmation: 'password')
Event.create!(name: "Test")
