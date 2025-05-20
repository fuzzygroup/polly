class AddSetupTimeToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :time_setup, :time
  end
end