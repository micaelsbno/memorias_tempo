module SessionsHelper
  def store_user_session
    if valid_user? user
      session[:user_id] = user.id
      session[:username] = user.username
    end
  end

  def delete_user_session
    session[:user_id] = nil
    session[:username] = nil
  end

  def user
    User.find_by(username: params[:username])
  end

  def valid_user?(user)
    !!user
  end
end

