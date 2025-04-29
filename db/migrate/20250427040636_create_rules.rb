class CreateRules < ActiveRecord::Migration[8.0]
  def change
    create_table :rules do |t|
      t.string :name
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.boolean :active, default: true
      t.text :body
      t.text :notes

      t.timestamps
    end
  end
end
