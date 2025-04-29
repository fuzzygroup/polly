class AddSignalLinkToTeams < ActiveRecord::Migration[8.0]
  def change
    add_column :teams, :chat_url, :string
  end
end