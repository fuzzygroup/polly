class CreateAvailabilities < ActiveRecord::Migration[8.0]
  def change
    create_table :availabilities do |t|
      t.references :user, foreign_key: true
      t.references :organization, foreign_key: true
      t.date :date_start
      t.date :date_end
      t.boolean :availability, default: false

      t.timestamps
    end
  end
end
