class AddCoordinatesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :bike_ads, :latitude, :float
    add_column :bike_ads, :longitude, :float
  end
end
