class HomepageController < ApplicationController
  
  include HomepageHelper

  def index
    if logged_in?
      @user = session[:username]
      @id = session[:user_id]
    end
    render :index
  end
end
