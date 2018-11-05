class UsersController < ApplicationController
  
  include UsersHelper

  def create
    user = new_user
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
