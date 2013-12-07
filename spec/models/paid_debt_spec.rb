require 'spec_helper'

describe PaidDebt do 

  describe "should inherit from Payment" do
    PaidDebt.superclass { should == Payment }
  end
end