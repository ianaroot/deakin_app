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

require 'spec_helper'

describe Payment do
  let!(:owed) { FactoryGirl.create(:deakinite) }
  let!(:ower) { FactoryGirl.create(:deakinite) }
  before { @payment = Payment.new(amount: 34.57, owed_from_id: ower.id, owed_to_id: owed.id) }

  subject { @payment }

  it { should respond_to(:amount) }
  it { should respond_to(:owed_to) }
  it { should respond_to(:owed_from) }


  it { should be_valid }

  describe "when first created" do
    Payment.last { should == UnpaidDebt.last }
  end

end
