class CreateEventTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :event_tasks do |t|
      t.string :name
      t.references :organization, foreign_key: true
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.boolean :done, default:false
      t.string :url
      t.text :body
      t.text :notes
      t.timestamps
    end
  end
end
