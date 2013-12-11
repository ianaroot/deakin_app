# == Schema Information
#
# Table name: debts
#
#  id           :integer          not null, primary key
#  amount       :float
#  owed_from_id :integer
#  owed_to_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  type         :string(255)      default("UnpaidDebt")
#

class Debt < ActiveRecord::Base
  attr_accessible :amount, :owed_from_id, :owed_to_id, :paid
  # validates :owed_from_id, presence: true
  # validates :owed_to_id, presence: true

  belongs_to :owed_to, class_name: "User"
  belongs_to :owed_from, class_name: "User"

end
