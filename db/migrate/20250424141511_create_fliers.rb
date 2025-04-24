class CreateFliers < ActiveRecord::Migration[8.0]
  def change
    create_table :fliers do |t|
      t.string :title
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
