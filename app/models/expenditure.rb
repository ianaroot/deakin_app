class Expenditure < ActiveRecord::Base
  attr_accessible :date, :amount, :food
  belongs_to :user
end