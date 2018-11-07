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
    new_posts = Post.where(user: params[:id]).order('created_at desc').limit(10).offset(params[:offset])
    render json: new_posts
  end
end