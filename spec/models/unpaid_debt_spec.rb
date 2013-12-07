require 'spec_helper'

describe UnpaidDebt do

  before { @unpaid_debt = UnpaidDebt.new }
  subject { @unpaid_debt }

  describe "should inherit from Payment" do
    UnpaidDebt.superclass { should == Payment }
  end

  describe "should be able to record as paid" do
    before { @unpaid_debt.record_as_paid }
    PaidDebt.all { should include(it) }
    UnpaidDebt.all { should_not include(it) }
  end

end