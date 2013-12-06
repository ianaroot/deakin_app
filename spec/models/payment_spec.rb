require 'spec_helper'

describe Payment do
  
  before { @payment = Payment.new(amount: 34.57, owed_from: "snoop", owed_to: "schlag") }

  subject { @payment }

  it { should respond_to(:paid) }
  it { should respond_to(:paid?) }
  it { should respond_to(:amount) }
  it { should respond_to(:owed_to) }
  it { should respond_to(:owed_from) }

  it { should be_valid }

  describe "when first created" do
    it { should_not be_paid }
  end

end