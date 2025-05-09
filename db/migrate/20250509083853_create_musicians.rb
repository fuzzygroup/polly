class CreateMusicians < ActiveRecord::Migration[8.0]
  def change
    create_table :musicians do |t|
      t.string :name
      t.string :band_name
      t.text :bio
      t.string :url
      t.string :pronouns
      t.integer :play_count
      t.text :notes
      t.references :user, foreign_key: true
      t.references :contact_card, foreign_key: true

      t.timestamps
    end
  end
end
