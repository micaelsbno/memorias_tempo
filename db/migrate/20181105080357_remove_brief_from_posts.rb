class RemoveBriefFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :brief, :string
  end
end
