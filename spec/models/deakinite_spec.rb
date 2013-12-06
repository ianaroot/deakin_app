# == Schema Information
#
# Table name: deakinites
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  eats_house_food :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

require 'spec_helper'

describe Deakinite do

  before { @deakinite = FactoryGirl.create(:deakinite)}
  subject { @deakinite }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:eats_house_food) }
  it { should respond_to(:payments_owed) }
  it { should respond_to(:payments_owing) }
  it { should respond_to(:owed_deakinites) }
  it { should respond_to(:owing_deakinites) }

  it { should be_valid }

  describe "when name is not present" do

  end

  describe "when email is not present" do

  end


  describe "when password is not present" do

  end


  describe "when password does not match confirmation" do

  end

  describe "when password confirmation is nil" do

  end

end
