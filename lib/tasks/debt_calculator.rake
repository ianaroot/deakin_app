namespace :debts  do
  task :calculate => :environment do
    # we subtract one from the month because they are stored that way for the array
    # and then one more because we want the previous month
    month = Date.current.month - 2
    year = Date.current.year

    #create method to calculate food_expenses_per_user
    food_expenses_total = Expense.total_amount_of_expenses_where_month_and_year_and_food(month, year, "food")
    food_expense_per_user = food_expenses_total / User.where(eats_house_food: true).count
    #create method to calculate general_expenses_per_user
    general_expenses_total = Expense.total_amount_of_expenses_where_month_and_year_and_food(month, year, "general")
    general_expenses_per_user = general_expenses_total / User.count


    User.all.each do |user|
      unless user.primary_rent_payer == true

        users_general_expenses_total = 0.0
        #create method to return the total of a user's general expenses
        users_general_expenses = user.expenses.where(kind: "general")
        users_general_expenses.each { |exp| users_general_expenses_total += exp.amount }
        
        if user.eats_house_food == true
          users_food_expenses_total = 0.0
          #create method to return total of a user's food expenses
          users_food_expenses = user.expenses.where(kind: "food")
          users_food_expenses.each { |exp| users_food_expenses_total += exp.amount }

          user.debts_owing.create!(amount: (user.rent + (general_expenses_per_user - users_general_expenses_total) +
            (food_expense_per_user - users_food_expenses_total)).round(2), owed_to_id: User.find_by_primary_rent_payer(true).id)
        elsif user.eats_house_food == false
          user.debts_owing.create!(amount: (user.rent + (general_expenses_per_user - users_general_expenses_total)).round(2), owed_to_id: User.find_by_primary_rent_payer(true).id)
        end
      end
    end
  end  
end