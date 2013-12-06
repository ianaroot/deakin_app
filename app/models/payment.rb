class Payment < ActiveRecord::Base
  attr_accessible :amount, :owed_from, :owed_to, :paid
end
