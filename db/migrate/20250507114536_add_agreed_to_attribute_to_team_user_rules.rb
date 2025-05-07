class AddAgreedToAttributeToTeamUserRules < ActiveRecord::Migration[8.0]
  def change
    add_column :team_user_rules, :agreed_to, :boolean, :default => false
  end
end