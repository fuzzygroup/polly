class AddDateExpiresToTeams < ActiveRecord::Migration[8.0]
  def change
    add_column :teams, :date_expires, :date
  end
end