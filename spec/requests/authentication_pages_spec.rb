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