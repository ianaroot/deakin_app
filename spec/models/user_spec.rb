# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  eats_house_food :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

require 'spec_helper'

describe User do

  # before { @user = FactoryGirl.create(:user)}
  before { @user = User.new(name: "snoop", email: "snoop@snoop.com", password: "password",
                                      password_confirmation: "password") }
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:eats_house_food) }
  it { should respond_to(:debts_owed) }
  it { should respond_to(:debts_owing) }
  it { should respond_to(:owed_users) }
  it { should respond_to(:owing_users) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid}
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-er@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end


  describe "when password is not present" do
    before { @user.password = " " }
    it { should_not be_valid }
  end


  describe "when password does not match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user ) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }


      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end

  describe "owing" do
    let(:other_user) { FactoryGirl.create(:user) }
    before do
      @user.save
      @user.debts_owing.create(owed_to_id: other_user, amount: 34.57)
    end

    its(:owed_users) { should include(other_user) }
    its(:owing_users) { should_not include(other_user) }
  end

  describe "being owed" do
    let(:other_user) { FactoryGirl.create(:user) }
    before do
      @user.save
      other_user.debts_owing.create(owed_to_id: @user, amount: 52.00)
    end

    its(:owing_users) { should include(other_user) }
    its(:owed_users) { should_not include(other_user) }
  end

end
