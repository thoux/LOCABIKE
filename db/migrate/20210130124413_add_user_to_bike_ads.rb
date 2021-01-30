class AddUserToBikeAds < ActiveRecord::Migration[6.0]
  def change
    add_reference :bike_ads, :user, null: false, foreign_key: true
  end
end
