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
      date = {year: 2013, month: 9, day: 27}
      @expenditure = user.add_expenditure(57, date, true)
    end
  subject { @expenditure }

  it { should respond_to(:date) }
  it { should respond_to(:amount) }
  it { should respond_to(:user) }
  it { should respond_to(:food)}

  its(:date) { should eq(Date.new(2013,9,27)) }

end
