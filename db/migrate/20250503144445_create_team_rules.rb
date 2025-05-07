class CreateTeamRules < ActiveRecord::Migration[8.0]
  def change
    create_table :team_rules do |t|
      t.references :team, foreign_key: true
      t.references :rule, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
