class CreateOrganizationRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :organization_roles do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.text :job_description
      t.string :status, default:"Waiting for the Right Person to Sign Up for Glory and Heroism; Text Scott at 317 531 4853 to join the rebellion."

      t.timestamps
    end
  end
end
