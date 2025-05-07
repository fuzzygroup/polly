class CreateOrganizationRules < ActiveRecord::Migration[8.0]
  def change
    create_table :organization_rules do |t|
      t.references :organization, foreign_key: true
      t.references :rule, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
