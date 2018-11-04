class SessionsController < ApplicationController
  
  include SessionsHelper

  def create
    login_user if password_is_valid?
    redirect_to '/'
  end

  def destroy
    delete_user_session
    redirect_to '/'
  end
end
