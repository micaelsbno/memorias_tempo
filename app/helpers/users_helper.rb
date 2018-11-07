module UsersHelper
  def get_current_user_posts
    user = User.find_by(id: session[:user_id])
    if user
      return {
        posts: user.posts.order('created_at desc').limit(10),
        id: user.id,
        username: user.username
      }
    end
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def valid_user? (user_id)
    !!User.find_by(id: user_id)
  end

  def new_user
    User.new(username: params[:username], password: params[:password])
  end
end
