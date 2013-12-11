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

describe UnpaidDebt do

  before { @unpaid_debt = UnpaidDebt.new }
  subject { @unpaid_debt }

  describe "should inherit from Debt" do
    UnpaidDebt.superclass { should == Debt }
  end

  describe "should be able to record as paid" do
    before { @unpaid_debt.record_as_paid }
    PaidDebt.all { should include(it) }
    UnpaidDebt.all { should_not include(it) }
  end

end
