require 'spec_helper'

describe "Authenticaion" do 

  subject { page }

  describe "signin page" do

    before { visit signin_path }

    it { should have_selector('input', value: "Sign in") }

    describe "with invalid information" do
      let(:deakinite) { FactoryGirl.create(:deakinite) }
      before { click_button "Sign in" }

      it { should have_selector('input', value: "Sign in") }
    end
  end

end

# unrelated to actual app, but i can't make any sense of why these
# tests pass sometimes but not always??
  # $count = 0
  # describe "let" do
  #   let(:count) { $count += 1 }

  #   it "memoizes the value" do
  #     count.should eq(1)
  #     count.should eq(1)
  #   end

  #   it "is not cached across examples" do
  #     count.should eq(2)
  #   end

  #   it "blahd" do
  #     count.should eq(3)
  #   end

  # end