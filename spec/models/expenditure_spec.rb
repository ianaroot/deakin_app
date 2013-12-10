require 'spec_helper'

describe Expenditure do 
  let!(:user) { FactoryGirl.create(:user) }
  before do
    date = {year: 2013, month: 9, day: 27}
    @expenditure = user.add_expenditure(57, date)
  end
  subject { @expenditure }

  it { should respond_to(:date) }
  it { should respond_to(:amount) }
  it { should respond_to(:user) }

  its(:date) { should eq(Date.new(2013,9,27)) }

end