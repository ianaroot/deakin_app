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
      describe "adding expenses" do
        describe "house food" do
          describe "without a date" do
            before { valid_signin(user) }
            it "should not make a new expense" do
              fill_in "food_expense_amount", with: 45
              expect { click_button "record food purchase" }.not_to change(Expense, :count).by(1)
            end
          end
          describe "without an amout" do
            before {valid_signin(user) }
            it "it should not make a new expense" do
              fill_in 'expense_date', with: "12/12/2013" 
              expect { click_button "record food purchase" }.not_to change(Expense, :count).by(1)
            end
          end
          describe "with amount and date filled in" do
            before { valid_signin(user) }
            it "should create a new expense" do
              fill_in 'expense_date', with: "12/12/2013"  
              fill_in "food_expense_amount", with: 45
              expect { click_button "record food purchase" }.to change(Expense.where(kind: "food"), :count).by(1)
            end
          end
        end

        describe "general" do
          describe "without a date" do
            before { valid_signin(user) }
            it "should not make a new expense" do
              fill_in "general_expense_amount", with: 45
              expect { click_button "record general purchase" }.not_to change(Expense, :count).by(1)
            end
          end
          describe "without an amout" do
            before {valid_signin(user) }
            it "it should not make a new expense" do
              fill_in 'expense_date', with: "12/12/2013" 
              expect { click_button "record general purchase" }.not_to change(Expense, :count).by(1)
            end
          end
          describe "with amount and date filled in" do
            before { valid_signin(user) }
            it "should create a new expense" do
              within "#general_expense_form" do
                fill_in 'expense_date', with: "12/12/2013"  
              end
              fill_in "general_expense_amount", with: 45
              expect { click_button "record general purchase" }.to change(Expense.where(kind: "general"), :count).by(1)
            end
          end
        end
      end
    end
  end

end