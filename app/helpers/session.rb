helpers do

  def login(user)
    session[:id] = user.id
  end

  def logged_in?
    session[:id] != nil
  end

  # ANOTHER APPROACH:
  # current_user.present?
  # !!current_user

  def current_user
    @user ||= User.find(session[:id]) if session[:id]
  end

# ANOTHER APPROACH:
# @current_user ||= User.where(id: session[:id]).first

# clears just that session id
  def logout!
    session[:id] = nil
    redirect '/'
  end

end
