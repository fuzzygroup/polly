class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :name
      t.references :event_type, foreign_key: true
      t.date :date_start
      t.date :date_end
      t.time :time_start
      t.time :time_end
      t.string :location
      t.references :share_code, foreign_key: true
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :has_speakers
      t.boolean :has_musicians
      t.boolean :has_props
      t.boolean :has_partners
      t.text :body

      t.timestamps
    end
  end
end
