class ChangeTimeStartAndTimeEndOnEventsToTime < ActiveRecord::Migration[8.0]
  def change
    change_column :events, :time_start, :time, using: 'time_start::time'
    change_column :events, :time_end, :time, using: 'time_end::time'
  end
end
