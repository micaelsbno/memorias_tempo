module SessionsHelper
  def login_user
    user = User.find_by(username: params[:username])
    session[:user_id] = user.id
    session[:username] = user.username
    session[:posts] = user.posts
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def password_is_valid?
    user = User.find_by(username: params[:username])
    user.authenticate(params[:password])
  end

  def delete_user_session
    session[:user_id] = nil
    session[:username] = nil
  end
end
