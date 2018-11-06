class PagesController < ApplicationController
  
  include UsersHelper
  include SessionsHelper

  def index
    if logged_in?
      @user = get_current_user_posts
      render :dashboard
    else
      render :login
    end
  end
end
