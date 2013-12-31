# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
names = {schlag: [817, false], shark: [610, true], snoop:[750, true], sharman: [750, true], hagen: [765, true, true], jess: [750, true],
        david: [610, true], ian: [805, true], pebbles: [793]}

names.each do |name, attrs|
  deak = User.new(name: name, email: "#{name}@#{name}.com", password: "password",
                        password_confirmation: "password", rent: attrs[0], eats_house_food: attrs[1], primary_rent_payer: attrs[2] )
  deak.save
end

food_or_general = ["food", "general", "food", "food", "food"]
20.times do
  User.all.sample.expenses.create!(amount: (rand(15000) / 100.0), kind: food_or_general.sample, date: (Date.current - 30))
end