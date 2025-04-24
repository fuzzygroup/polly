class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.string :project_type
      t.boolean :active, default: false
      t.text :body

      t.timestamps
    end
  end
end
