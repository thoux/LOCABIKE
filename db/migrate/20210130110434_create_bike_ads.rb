class CreateBikeAds < ActiveRecord::Migration[6.0]
  def change
    create_table :bike_ads do |t|
      t.string :model, null: false
      t.string :brand, null: false
      t.string :category, null: false
      t.integer :year, null: false
      t.string :address, null: false
      t.integer :price_per_day, null: false
      t.boolean :available, default: true, null: false

      t.timestamps
    end
  end
end
