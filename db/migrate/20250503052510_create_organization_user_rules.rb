class CreateOrganizationUserRules < ActiveRecord::Migration[8.0]
  def change
    create_table :organization_user_rules do |t|
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true
      t.references :rule, foreign_key: true

      t.timestamps
    end
  end
end
