class AddFlierTypeToFliers < ActiveRecord::Migration[8.0]
  def change
    add_column :fliers, :flier_type, :string
  end
end