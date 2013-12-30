namespace :debts  do
  task :calculate => :environment do
    # we subtract one from the month because they are stored that way for the array
    # and then one more because we want the previous month
    month = Date.current.month - 2
    year = Date.current.year
    #can be broken down to one method using .send
    #first instantiate hash or perhaps array that will contain debt totals, send pertinent info to method that calculates debts, once for food once for general
    #then iterate through users creating debts


    food_expenses_total = Expense.total_amount_of_expenses_where_month_and_year_and_food(month, year, "food")
    puts "food_expenses_total is #{food_expenses_total}"
    food_expense_per_user = food_expenses_total / User.where(eats_house_food: true).count
    puts "food_expense_per_user is #{food_expense_per_user}"
    general_expenses_total = Expense.total_amount_of_expenses_where_month_and_year_and_food(month, year, "general")
    puts "general_expenses_total is #{general_expenses_total}"
    general_expenses_per_user = general_expenses_total / User.count
    puts "general_expenses_per_user is #{general_expenses_per_user}"
    User.all.each do |user|
      unless user.primary_rent_payer == true
        users_general_expenses = user.expenses.where(kind: "general")
        users_general_expenses_total = 0.0
        users_general_expenses.each { |exp| users_general_expenses_total += exp.amount }
        
        if user.eats_house_food == true
          users_food_expenses = user.expenses.where(kind: "food")
          users_food_expenses_total = 0.0
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