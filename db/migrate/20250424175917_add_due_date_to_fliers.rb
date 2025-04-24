class AddDueDateToFliers < ActiveRecord::Migration[8.0]
  def change
    add_column :fliers, :due_date, :date
  end
end