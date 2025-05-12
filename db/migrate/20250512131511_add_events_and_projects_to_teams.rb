class AddEventsAndProjectsToTeams < ActiveRecord::Migration[8.0]
  def change
    add_reference :teams, :event, foreign_key: true
    add_reference :teams, :project, foreign_key: true
  end
end
