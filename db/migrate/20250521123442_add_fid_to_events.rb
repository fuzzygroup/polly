class AddFidToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :fid, :string
    add_index :events, :fid
  end
end
