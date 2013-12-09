class SessionsController < ApplicationController

  def new

  end

  def create
    deakinite = Deakinite.find_by_email(params[:email].downcase)
    p
    p params[:password]
    if deakinite && deakinite.authenticate(params[:password])
      sign_in deakinite
      redirect_to root_url
    else
      #needs errors
      redirect_to signin_path
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end