class AddIdentifierToMusicians < ActiveRecord::Migration[8.0]
  def change
    add_column :musicians, :identifier, :string
    add_index :musicians, [:identifier], :unique => true
  end
end