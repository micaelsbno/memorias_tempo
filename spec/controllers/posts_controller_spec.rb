require 'rails_helper'

RSpec.describe Api::PostsController, type: :request do

  let (:user) { User.new(username: 'test_user', password: '1234') }
  before { 
    user.save
    post sessions_path, params: { username: user.username, password: user.password }
  }

  describe '#create' do
    it 'creates a post based on lat/lon' do 
      post '/posts', params: { lat: '-37.8231908', lon: '144.9889268', content: 'post_content' }
      hash_body = JSON.parse(response.body)
      expect(hash_body).to include({
        'content' => 'post_content', 
        "city" => "East Melbourne", 
      })
    end

    it 'creates a post based on ip' do
      post '/post_by_ip', params: { ip: '27.96.203.168', content: 'post_content' }
      hash_body = JSON.parse(response.body)
      expect(hash_body).to include({
        'content' => 'post_content', 
        "city" => "Sydney", 
      })
    end

    it 'creates post without city if cant find city' do
      post '/post_by_ip', params: { ip: '127.242.52.5', content: 'post_content' }
      hash_body = JSON.parse(response.body)
      expect(hash_body).to include({
        'content' => 'post_content', 
      })
    end
  end

  describe '#get_more_posts' do
    it 'shows 10 more posts when user scrolls down' do
      30.times { Post.create(content: 'testPost', user_id: user.id) }
      
      get "/user_posts/#{user.id}", params: { offset: '10' }
      hash_body = JSON.parse(response.body)

      expect(hash_body.length).to be 10
    end
  end

  describe '#dashboard_get_more_posts' do
    it 'shows 10 more posts when user scroll' do 
      30.times { Post.create(content: 'testPost', user_id: user.id) }
      
      get "/dashboard_posts/#{user.id}", params: { offset: '10' }
      hash_body = JSON.parse(response.body)

      expect(hash_body.length).to be 10
    end
  end
end
