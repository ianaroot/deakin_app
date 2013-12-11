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

require 'spec_helper'

describe PaidDebt do 

  describe "should inherit from Debt" do
    PaidDebt.superclass { should == Debt }
  end
end
