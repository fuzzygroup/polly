class CreateEventSlotTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :event_slot_types do |t|
      t.string :name
      t.integer :default_duration, default: 3
      t.string :default_duration_units, default: "minutes"
      t.timestamps
    end
  end
end
