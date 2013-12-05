class Deakinite < ActiveRecord::Base
  attr_accessible :eats_house_food, :email, :name, :password, :password_confirmation
  has_secure_password
end
