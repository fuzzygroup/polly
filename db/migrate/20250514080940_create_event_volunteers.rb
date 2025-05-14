class CreateEventVolunteers < ActiveRecord::Migration[8.0]
  def change
    create_table :event_volunteers do |t|
      t.string :first_name
      t.string :last_name
      t.string :pronouns
      t.string :phone_number
      t.string :email
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.text :how_do_you_want_to_help

      t.timestamps
    end
  end
end
