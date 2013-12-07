# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Deakinite.create({ name: "schlag", password: "password", email: "schlag@schlag.com",
  password_confirmation: "password"})

Deakinite.create({ name: "snoop", password: "password", email: "snoop@snoop.com",
  password_confirmation: "password"})

Deakinite.create({ name: "david", password: "password", email: "david@david.com",
  password_confirmation: "password"})

Deakinite.create({ name: "shark", password: "password", email: "shark@shark.com",
  password_confirmation: "password"})