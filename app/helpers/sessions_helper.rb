module SessionsHelper 

  def signed_in?
    current_user.nil?
  end

  def current_user
    @current_user ||= Deakinite.find_by_remember_token(cookies[:remember_token])
  end

  def sign_in(deakinite)
    cookies.permanent[:remember_token] = deakinite.remember_token
    self.current_user = deakinite
  end

  def current_user=(user)
    @current_user = user
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end

end