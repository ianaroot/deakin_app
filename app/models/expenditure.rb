# == Schema Information
#
# Table name: expenditures
#
#  id         :integer          not null, primary key
#  amount     :integer
#  date       :date
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  food       :boolean
#

class Expenditure < ActiveRecord::Base
  attr_accessible :date, :amount, :food, :user_id
  belongs_to :user

  validates :date, presence: true
  validates :amount, presence: true
  validates :user_id, presence: true

  
end
