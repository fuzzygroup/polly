class CreateEventProps < ActiveRecord::Migration[8.0]
  def change
    create_table :event_props do |t|
      t.string :name
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
