require 'spec_helper'

describe "Static pages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }
  

    describe "for non-signed-in users" do
      it { should have_selector('nav', text: "log in") }
    end
  end
end