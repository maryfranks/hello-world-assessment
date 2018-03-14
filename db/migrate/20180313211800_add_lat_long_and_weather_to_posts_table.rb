class AddLatLongAndWeatherToPostsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :long, :string
    add_column :posts, :lat, :string
    add_column :posts, :weather, :string
  end
end
