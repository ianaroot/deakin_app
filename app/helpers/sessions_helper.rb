module SessionsHelper 

  def signed_in?
    current_user.nil?
  end

  def current_user
    @current_user ||= Deakinite.find_by_remember_token(cookies[:remember_token])
  end

end