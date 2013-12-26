class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @house_food = current_user.expenses.build(food: true)
      @general_expense = current_user.expenses.build(food: false)
      @debts_owed = current_user.debts_owed.where(type: "UnpaidDebt")
      @debts_owing = current_user.debts_owing.where(type: "UnpaidDebt")
      puts @debts_owing
      puts @debts_owed
    else
      redirect_to signin_path 
    end
  end
  
end