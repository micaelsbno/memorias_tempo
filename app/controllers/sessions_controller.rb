class SessionsController < ApplicationController
  
  include SessionsHelper

  def new

  end
  
  def create
    store_user_session
    redirect_to '/'
  end

  def destroy
    delete_user_session
    redirect_to '/'
  end

end
