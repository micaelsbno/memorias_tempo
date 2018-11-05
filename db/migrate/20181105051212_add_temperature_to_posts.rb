class AddTemperatureToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :temp, :integer
  end
end
