class CreatePollOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :poll_options do |t|
      t.string :name
      t.references :poll, foreign_key: true
      t.string :widget_type
      t.string :value
      t.text :body

      t.timestamps
    end
  end
end
