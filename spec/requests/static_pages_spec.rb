require 'spec_helper'

describe "Static pages" do
  subject { page }
  let(:user) { FactoryGirl.create(:user) }

  describe "Home page" do
    before { visit root_path }
  

    describe "for non-signed-in users" do
      it { should have_selector('nav', link: 'log in') }
    end
    
     describe "for signed in users" do
      describe "adding expenditures" do
        describe "house food" do
          describe "without a date" do
            before { valid_signin(user) }
            it "should not make a new expenditure" do
              fill_in "food_expenditure_amount", with: 45
              expect { click_button "record food purchase" }.not_to change(Expenditure, :count).by(1)
            end
          end
          describe "without an amout" do
            before {valid_signin(user) }
            it "it should not make a new expenditure" do
              fill_in 'food_expenditure_date', with: "12/12/2013" 
              expect { click_button "record food purchase" }.not_to change(Expenditure, :count).by(1)
            end
          end
          describe "with amount and date filled in" do
            before { valid_signin(user) }
            it "should create a new expenditure" do
              fill_in 'food_expenditure_date', with: "12/12/2013"  
              fill_in "food_expenditure_amount", with: 45
              expect { click_button "record food purchase" }.to change(Expenditure.where(food: true), :count).by(1)
            end
          end
        end
      end
    end
  end

end