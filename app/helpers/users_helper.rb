module UsersHelper
  def get_current_user_info
    user = User.find_by(id: session[:user_id])
    if user
      return {
        posts: user.posts,
        id: user.id,
        username: user.username
      }
    end
  end

  def valid_user? (user_id)
    !!User.find_by(id: user_id)
  end
end
