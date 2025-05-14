class CreateConfirmations < ActiveRecord::Migration[8.0]
  def change
    create_table :confirmations do |t|
      t.references :confirmable, polymorphic: true
      t.references :event_slot, foreign_key: true
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
