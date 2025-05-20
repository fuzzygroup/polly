class AddVisibilityToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :visibility, :string, default: 'all'
  end
end