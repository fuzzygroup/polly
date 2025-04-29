class CreateContactCards < ActiveRecord::Migration[8.0]
  def change
    create_table :contact_cards do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :company
      t.string :city
      t.string :state
      t.integer :congressional_district
      t.string :county
      t.boolean :is_me, default: false
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true
      t.date :birthday
      t.string :birth_date
      t.integer :birth_year
      t.string :email_primary
      t.string :email_secondary
      t.string :phone_mobile
      t.string :phone_secondary
      t.string :signal_username
      t.string :discord_username
      t.string :discord_server
      t.string :url
      t.string :favorite_movie
      t.string :favorite_color
      t.string :favorite_coffee
      t.string :favorite_cocktail
      t.boolean :vip, default: false
      t.boolean :politician, default: false
      t.boolean :donor, default: false
      t.boolean :needs_attention, default: false
      t.text :notes
      t.text :history

      t.timestamps
    end
  end
end
