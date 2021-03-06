# == Schema Information
#
# Table name: expenses
#
#  id         :integer          not null, primary key
#  amount     :integer
#  date       :date
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  food       :boolean
#  week       :integer
#  month      :integer
#  year       :integer
#

class Expense < ActiveRecord::Base
  attr_accessible :date, :amount, :kind, :user_id
  belongs_to :user

  before_save :create_week, :create_month, :create_year

  validates :date, presence: true
  validates :amount, presence: true
  validates :user_id, presence: true

  def self.total_amount_of_expenses_where_month_and_year_and_food(month, year, kind)
    expenses_amount_total = 0.0
    Expense.where(month: month).where(year: year).where(kind: kind).each { |exp| expenses_amount_total +=  exp.amount }
    expenses_amount_total
  end

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
