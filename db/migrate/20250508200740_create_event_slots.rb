class CreateEventSlots < ActiveRecord::Migration[8.0]
  def change
    create_table :event_slots do |t|
      t.string :name
      t.references :event, foreign_key: true
      t.references :event_slot_type, foreign_key: true
      t.references :speaker, foreign_key: true
      t.integer :duration
      t.time :computed_start_at
      t.text :body

      t.timestamps
    end
  end
end
