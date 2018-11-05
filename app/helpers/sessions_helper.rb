module SessionsHelper
  def login_user
    user = User.find_by(username: params[:username])
    session[:user_id] = user.id
    session[:username] = user.username
    session[:posts] = user.posts
  end

  def logged_in?
    !!session[:user_id]
  end

  def login_is_valid?
    user = User.find_by(username: params[:username])
    return user.authenticate(params[:password]) if user
    false
  end

  def delete_user_session
    session[:user_id] = nil
    session[:username] = nil
  end
end
