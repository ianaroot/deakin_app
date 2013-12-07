# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  amount     :float
#  owed_from  :string(255)
#  owed_to    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  paid       :boolean          default(FALSE)
#

class Debt < ActiveRecord::Base
  attr_accessible :amount, :owed_from_id, :owed_to_id, :paid
  # validates :owed_from_id, presence: true
  # validates :owed_to_id, presence: true

  belongs_to :owed_to, class_name: "Deakinite"
  belongs_to :owed_from, class_name: "Deakinite"

end
