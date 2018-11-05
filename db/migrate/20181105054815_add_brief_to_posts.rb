class AddBriefToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :brief, :string
  end
end
