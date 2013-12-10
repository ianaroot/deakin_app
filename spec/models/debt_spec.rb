# == Schema Information
#
# Table name: debts
#
#  id         :integer          not null, primary key
#  amount     :float
#  owed_from  :string(255)
#  owed_to    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  paid       :boolean          default(FALSE)
#

require 'spec_helper'

describe Debt do
  let!(:owed) { FactoryGirl.create(:user) }
  let!(:ower) { FactoryGirl.create(:user) }
  before { @debt = Debt.new(amount: 34.57, owed_from_id: ower.id, owed_to_id: owed.id) }

  subject { @debt }

  it { should respond_to(:amount) }
  it { should respond_to(:owed_to) }
  it { should respond_to(:owed_from) }


  it { should be_valid }

  describe "when first created" do
    Debt.last { should == UnpaidDebt.last }
  end

end
