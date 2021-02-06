class AddDescriptionToBikeAds < ActiveRecord::Migration[6.0]
  def change
    add_column :bike_ads, :description, :text, null: false
  end
end
