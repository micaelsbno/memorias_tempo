class UsersController < ApplicationController
  def create
    user = User.new(username: params[:username], password: params[:password])
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    end    
  end

  def new
    render :register
  end
end
