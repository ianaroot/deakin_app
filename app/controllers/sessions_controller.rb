class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_email(params[:email].downcase)
    p
    p params[:password]
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_to root_url
    else
      flash[:errors] = "incorrect email or password"
      redirect_to signin_path
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end