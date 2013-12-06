FactoryGirl.define do 
  factory :deakinite do
    name              { Faker::Name.name }
    email             { Faker::Internet.email }
    password          { "password" }
    password_confirmation          { "password" }
  end
end