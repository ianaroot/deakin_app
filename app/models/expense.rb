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

class Expense < ActiveRecord::Base
  attr_accessible :date, :amount, :food, :user_id
  belongs_to :user

  before_save :create_week, :create_month, :create_year

  validates :date, presence: true
  validates :amount, presence: true
  validates :user_id, presence: true

  private

    def create_month
      #month has one subtracted because it's use is in an array of months
      #and also as we cross years, we loop with modulus,
      #this all means that january is the 0th month and December is the 11th
      self.month = self.date.month - 1
    end

    def create_year
      self.year = self.date.year
    end

    def create_week
      self.week = self.date.day / 7 + 1
    end
  
end
