class AddWeatherToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :city, :string
    add_column :posts, :country, :string
    add_column :posts, :lat, :float
    add_column :posts, :lon, :float
    add_column :posts, :weather_description, :string
    add_column :posts, :weather_brief, :string
  end
end
