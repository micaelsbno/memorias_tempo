# frozen_string_literal: true

class UsersController < ApplicationController
  include UsersHelper

  def index
    if logged_in?
      @user = current_user
      @posts = get_user_first_10_posts
      render :show
    else
      render :login
    end
  end

  def create
    user = new_user
    if user.save
      session[:user_id] = user.id
      redirect_to "/"
    else
      @error = "Username or password invalid"
      render "register"
    end
  end

  def show
    @user = User.find_by(username: params[:id])
    @posts = get_user_first_10_posts
    render :show
  end

  def register
  end
end
