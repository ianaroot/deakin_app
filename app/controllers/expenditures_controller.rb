class ExpendituresController < ApplicationController

  def create
    @expenditure = current_user.expenditures.build(params[:expenditure])
    if @expenditure.save
      flash[:success] = "expenditure saved"
    else
      flash[:error] =  @expenditure.errors.full_messages
    end
      redirect_to root_path
  end

end