class AddStatusToProject < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :status, :string
    add_column :projects, :due_date, :date
    add_column :projects, :url, :string
  end
end