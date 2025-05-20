class AddShowActionLinksToEvents < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :show_action_links, :boolean, default: true
  end
end