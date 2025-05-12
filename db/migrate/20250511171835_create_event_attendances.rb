class CreateEventAttendances < ActiveRecord::Migration[8.0]
  def change
    create_table :event_attendances do |t|
      t.references :event, foreign_key: true
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :status
      t.string :name
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
  end
end
