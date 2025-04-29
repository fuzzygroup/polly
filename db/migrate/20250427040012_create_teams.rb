class CreateTeams < ActiveRecord::Migration[8.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
