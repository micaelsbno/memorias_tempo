class SessionsController < ApplicationController
  
  include SessionsHelper

  def create
    if login_is_valid?
      login_user 
      redirect_to '/'
    else
      @error = 'Username or password invalid'
      render :new
    end
  end

  def destroy
    delete_user_session
    redirect_to '/'
  end
end
