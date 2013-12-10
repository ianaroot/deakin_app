class Expenditure < ActiveRecord::Base
  attr_accessible :date, :amount
  belongs_to :user
end