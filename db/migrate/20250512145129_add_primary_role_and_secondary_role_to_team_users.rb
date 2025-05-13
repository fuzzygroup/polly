class AddPrimaryRoleAndSecondaryRoleToTeamUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :team_users, :primary_team_role, :string
    add_column :team_users, :secondary_team_role, :string
  end
end
