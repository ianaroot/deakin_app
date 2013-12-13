class ExpensesController < ApplicationController
  MONTH_NAMES = %w(January February March April May June July August September October November December)

  def create
    @expense = current_user.expenses.build(params[:expense])
    if @expense.save
      flash[:success] = "expense saved"
    else
      flash[:error] =  @expense.errors.full_messages
    end
    redirect_to root_path
  end

  def index
    if params[:display_month_number]
      @display_month_number = params[:display_month_number].to_i % 12
    else
      @display_month_number = Date.current.month
    end
    if !Expense.where(month: Date.current.month).empty?
      @expenses = Expense.where(month: @display_month_number).order(:week)
    else
      @expenses = []
    end
    @display_month_names = {current: MONTH_NAMES[(@display_month_number - 1) % 12], previous: MONTH_NAMES[(@display_month_number - 2) % 12],
                            coming: MONTH_NAMES[(@display_month_number) % 12]}
  end

  private
    def adjust_month(month_number)
      if month_number == 0
        month_number = 12
      elsif  month_number == 13
        month_number = 1
      end
      month_number
    end
  #RUDE.
end