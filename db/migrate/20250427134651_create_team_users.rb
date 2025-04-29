class CreateTeamUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :team_users do |t|
      t.references :team, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :active, default: true
      t.boolean :leader, default: false
      t.string :notes

      t.timestamps
    end
  end
end
