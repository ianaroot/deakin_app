require 'spec_helper'

describe PaidDebt do 

  describe "should inherit from Debt" do
    PaidDebt.superclass { should == Debt }
  end
end