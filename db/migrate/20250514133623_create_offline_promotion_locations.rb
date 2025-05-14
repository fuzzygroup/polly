class CreateOfflinePromotionLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :offline_promotion_locations do |t|
      t.string :name
      t.references :contact_card, foreign_key: true

      t.timestamps
    end
  end
end
