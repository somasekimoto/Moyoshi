class AddLatitudeAndLongitudeToPost < ActiveRecord::Migration[5.2]
  def up
    add_column :posts, :latitude, :float
    add_column :posts, :longitude, :float
    add_column :posts, :address, :string
  end

  def down
  end
end
