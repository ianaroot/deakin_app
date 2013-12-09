# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
names = ["schlag", "shark", "snoop", "sharman"]

names.each do |name|
  deak = Deakinite.new(name: name, email: "#{name}@#{name}.com", password: "password",
                        password_confirmation: "password" )
  deak.save
end