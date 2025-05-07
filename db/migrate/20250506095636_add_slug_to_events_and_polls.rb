class AddSlugToEventsAndPolls < ActiveRecord::Migration[8.0]
  def change
    add_column :events, :slug, :string
    add_column :polls, :slug, :string
    add_index :events, :slug
    add_index :polls, :slug
  end
end