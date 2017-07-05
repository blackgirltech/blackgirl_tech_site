# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

base = Membership.create(membership_type: "BASE")
club = Membership.create(membership_type: "CLUB")
ally = Membership.create(membership_type: "ALLY")
Member.create!(email: 'fadmin@example.com', password: 'password', password_confirmation: 'password')
Member.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)