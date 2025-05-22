class CreateSpeeches < ActiveRecord::Migration[8.0]
  def change
    create_table :speeches do |t|
      t.string :name
      t.string :tags
      t.string :slug
      t.references :organization, foreign_key: true
      t.references :speaker, foreign_key: true
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.text :body

      t.timestamps
    end
    add_index :speeches, [:slug], :unique => true
  end
end