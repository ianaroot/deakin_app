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
      @display_year = params[:display_year].to_i + (params[:display_month_number].to_i / 12)
      puts @display_month_number
      puts @display_year
    else
      #see explanantion in expense model for subtracting one from month
      date = Date.current
      @display_month_number = date.month - 1
      @display_year = date.year
    end
    if !Expense.where(month: @display_month_number).where(year: @display_year).empty?
      @expenses = Expense.where(month: @display_month_number).where(year: @display_year).order(:week)
    else
      @expenses = []
    end
    @display_month_names = {current: MONTH_NAMES[(@display_month_number) % 12], previous: MONTH_NAMES[(@display_month_number - 1) % 12],
                            coming: MONTH_NAMES[(@display_month_number + 1) % 12]}
  end

end