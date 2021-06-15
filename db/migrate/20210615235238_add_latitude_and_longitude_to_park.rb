class AddLatitudeAndLongitudeToPark < ActiveRecord::Migration[5.2]
  def change
    add_column :parks, :latitude, :string
    add_column :parks, :longitude, :string
  end
end
