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

describe Debt do
  let!(:owed) { FactoryGirl.create(:user) }
  let!(:ower) { FactoryGirl.create(:user) }
  before { @debt = ower.establish_debt_to(owed, 52.43)}
  subject { @debt }

  it { should respond_to(:amount) }
  it { should respond_to(:owed_to) }
  it { should respond_to(:owed_from) }
  its(:owed_to) { should eq(owed) }
  its(:owed_from) { should eq(ower) }

  it { should be_valid }

  describe "when first created" do
    Debt.last { should == UnpaidDebt.last }
  end

end
