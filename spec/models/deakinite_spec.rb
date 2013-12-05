require 'spec_helper'

describe Deakinite do

  before { @deakinite = Deakinite.new(name: "snoop", email: "snoop@snoopzample.com", password: "snoop",
                                  password_confirmation: "snoop", eats_house_food: true) }

  subject { @deakinite }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:eats_house_food) }
  # it { should respond_to(:payments_owed) }
  # it { should respond_to(:payments_owing) }

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