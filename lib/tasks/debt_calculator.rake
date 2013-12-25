namespace :debts  do
  task :calculate => :environment do
    # we subtract one from the month because they are stored that way for the array
    # and then one more because we want the previous month
    month = Date.current.month - 2
    year = Date.current.year
    #can be broken down to one method using .send
    #first instantiate hash or perhaps array that will contain debt totals, send pertinent info to method that calculates debts, once for food once for general
    #then iterate through users creating debts


    food_expenses_total = Expense.total_amount_of_expenses_where_month_and_year_and_food(month, year, true)
    food_expense_per_eater = food_expenses_total / User.where(eats_house_food: true).count
    general_expenses_total = Expense.total_amount_of_expenses_where_month_and_year_and_food(month, year, false)
    general_expenses_per_user = general_expenses_total / User.count
    User.where(eats_house_food: true).each do |eater|
      unless eater.primary_rent_payer == true
        users_food_expenses = eater.expenses.where(food: true)
        users_food_expenses_total = 0.0
        unless users_food_expenses.empty?
          users_food_expenses.each { |exp| users_food_expenses_total += exp.amount }
        end
        eater.debts_owing.create!(amount: ((users_food_expenses_total - food_expense_per_eater)).round(2), owed_to_id: User.find_by_primary_rent_payer(true).id)
      end
    end
    User.all.each do |user|
      unless user.primary_rent_payer == true
        users_general_expenses = user.expenses.where(food: false)
        users_general_expenses_total = 0.0
        unless users_general_expenses.empty?
          users_general_expenses.each { |exp| users_general_expenses_total += exp.amount }
        end
        user.debts_owing.create!(amount: (user.rent + (users_general_expenses_total - general_expenses_per_user)).round(2), owed_to_id: User.find_by_primary_rent_payer(true).id)
      end
    end
  end  
end