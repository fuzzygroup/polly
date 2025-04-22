class CreateOrganizations < ActiveRecord::Migration[8.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :location
      t.string :organization_type
      t.string :identifier, null: false

      t.timestamps
    end
    add_index :organizations, :identifier, unique: true

  end
end