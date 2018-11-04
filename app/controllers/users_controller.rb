class UsersController < ApplicationController
  def create
    user = User.new(username: params[:username], password: params[:password])
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      @error = 'Username is already taken'
      render 'register'
    end    
  end

  def register
  end
end
