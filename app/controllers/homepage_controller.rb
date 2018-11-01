class HomepageController < ApplicationController
  def index
    @user = session[:username]
    render :index
  end
end
