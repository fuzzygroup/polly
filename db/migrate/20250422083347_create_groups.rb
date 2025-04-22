class CreateGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.references :organization, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
