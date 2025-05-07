class CreateTeamUserRules < ActiveRecord::Migration[8.0]
  def change
    create_table :team_user_rules do |t|
      t.references :team, foreign_key: true
      t.references :user, foreign_key: true
      t.references :rule, foreign_key: true

      t.timestamps
    end
  end
end
