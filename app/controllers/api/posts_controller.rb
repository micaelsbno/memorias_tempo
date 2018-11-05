class Api::PostsController < ApplicationController
  
  include PostsHelper

  def create
    post = Post.new(create_post)
    if post.save
      render json: post
    end
    false
  end
end