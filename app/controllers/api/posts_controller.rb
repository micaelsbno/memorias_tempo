class Api::PostsController < ApplicationController
  
  include PostsHelper

  def create
    post = create_post
    if post.save
      render json: post
    end
    false
  end

  def create_by_ip
    post = create_post_by_ip
    if post.save
      render json: post
    end
    false
  end

  def get_more_posts
    render json: get_10_next_posts
  end
end