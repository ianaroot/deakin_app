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

  before_save :create_week, :create_month

  validates :date, presence: true
  validates :amount, presence: true
  validates :user_id, presence: true

  private

  def create_week
    self.week = self.date.day / 7 + 1
  end

  def create_month
    self.month = self.date.month
  end
  
end
