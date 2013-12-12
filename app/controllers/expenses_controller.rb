class ExpensesController < ApplicationController

  def create
    @expense = current_user.expenses.build(params[:expense])
    if @expense.save
      flash[:success] = "expense saved"
    else
      flash[:error] =  @expense.errors.full_messages
    end
      redirect_to root_path
  end

end