class CreatePoliticalActions < ActiveRecord::Migration[8.0]
  def change
    create_table :political_actions do |t|
      t.string :name
      t.boolean :active, default: true
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true
      t.text :details
      t.timestamps
    end
  end
end
