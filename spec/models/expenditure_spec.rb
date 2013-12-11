# == Schema Information
#
# Table name: expenditures
#
#  id         :integer          not null, primary key
#  amount     :integer
#  date       :date
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  food       :boolean
#

require 'spec_helper'

describe Expenditure do 
  let!(:user) { FactoryGirl.create(:user) }
    before do
      date = Date.new(2013,9,27)
      @expenditure = user.expenditures.build(amount: 57, date: date, food: true)
    end
  subject { @expenditure }

  it { should respond_to(:date) }
  it { should respond_to(:amount) }
  it { should respond_to(:user) }
  it { should respond_to(:food)}

  it { should be_valid }

  its(:user) { should eq(user)}

end
