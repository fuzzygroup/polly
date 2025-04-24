class ChangeTitleToNameOnFliers < ActiveRecord::Migration[8.0]
  def change
    rename_column :fliers, :title, :name
  end
end