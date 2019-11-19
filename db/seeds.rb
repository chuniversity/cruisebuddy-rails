# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# p User.find_or_create_by!(email: 'example@mail.com' , password: '123123123' , password_confirmation: '123123123')

p User.create!(email: 'example@mail.com' , password: '123123123' , password_confirmation: '123123123')

cruise_line = CruiseLine.find_or_create_by!(name: Faker::Lorem.words(number: 4).join(' '))
p cruise_line
p Ship.find_or_create_by!(name: Faker::Lorem.words(number: 1), cruise_line: cruise_line)

