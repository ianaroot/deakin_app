class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @house_food = current_user.expenses.build(food: true)
      @general_expense = current_user.expenses.build(food: false)
    else
      redirect_to signin_path 
    end
  end
  
end