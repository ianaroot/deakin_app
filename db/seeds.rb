# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
names = {schlag: [810, false], shark: [680, true], snoop:[730, true], sharman: [730, true], hagen: [800, true, true]}

names.each do |name, attrs|
  deak = User.new(name: name, email: "#{name}@#{name}.com", password: "password",
                        password_confirmation: "password", rent: attrs[0], eats_house_food: attrs[1], primary_rent_payer: attrs[2] )
  deak.save
end

food_or_general = [true, false, true, true, true]
20.times do
  User.all.sample.expenses.create!(amount: (rand(15000) / 100.0), food: food_or_general.sample, date: (Date.current - 60))
end