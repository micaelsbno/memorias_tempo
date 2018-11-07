class UsersController < ApplicationController
  
  include UsersHelper

  def index
    if logged_in?
      @user = current_user
      @posts = @user.posts.order('created_at desc').limit(10)
      render :show
    else
      render :login
    end
  end

  def create
    user = new_user
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      @error = 'Username or password invalid'
      render 'register'
    end    
  end

  def show
    @user = User.find_by(username: params[:id])
    @posts = @user.posts.order('created_at desc').limit(10)
    render :show
  end

  def register
  end
end
