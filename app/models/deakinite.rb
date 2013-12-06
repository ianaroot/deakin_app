# == Schema Information
#
# Table name: deakinites
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  eats_house_food :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class Deakinite < ActiveRecord::Base
  attr_accessible :eats_house_food, :email, :name, :password, :password_confirmation
  has_secure_password
  
  has_many :payments_owed, foreign_key: "owed_to_id", class_name: "Payment"
  has_many :payments_owing, foreign_key: "owed_from_id", class_name: "Payment"
  has_many :owed_deakinites, through: :payments_owing, source: :owed_to
  has_many :owing_deakinites, through: :payments_owed, source: :owed_from


end
