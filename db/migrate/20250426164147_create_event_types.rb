class CreateEventTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :event_types do |t|
      t.string :name
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
