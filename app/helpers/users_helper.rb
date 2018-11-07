# frozen_string_literal: true

module UsersHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def valid_user? (user_id)
    !!User.find_by(id: user_id)
  end

  def new_user
    User.new(username: params[:username], password: params[:password])
  end
end
