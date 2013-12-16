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
    # @display_year = params[:display_year].to_i + ( params[:display_month_number].to_i / 12)
    # if params[:display_month_number]
    #   @display_month_number = params[:display_month_number].to_i % 12
    # else
    #   @display_month_number = Date.current.month
    #   @display_year = Date.current.year
    # end
    # if !Expense.where(month: Date.current.month).empty?
    #   @expenses = Expense.where(month: @display_month_number).order(:week)
    # else
    #   @expenses = []
    # end
    # @display_month_names = {current: MONTH_NAMES[(@display_month_number) % 12 - 1], previous: MONTH_NAMES[(@display_month_number - 1) % 12 -1],
    #                         coming: MONTH_NAMES[(@display_month_number + 1) % 12 - 1]}
    # puts @display_year
    # puts @display_month_number
    # puts "coming number is #{(@display_month_number + 1) % 13}"

  if params[:display_month_number]
    @display_month_number = params[:display_month_number].to_i
  else
    #see explanantion in expense model for subtracting one from month
    @display_month_number = Date.current.month - 1
  end
  if !Expense.where(month: @display_month_number).empty?
    @expenses = Expense.where(month: @display_month_number).order(:week)
  else
    @expenses = []
  end
    @display_month_names = {current: MONTH_NAMES[(@display_month_number) % 12], previous: MONTH_NAMES[(@display_month_number - 1) % 12],
                            coming: MONTH_NAMES[(@display_month_number + 1) % 12]}
    puts @display_month_number
  end

end