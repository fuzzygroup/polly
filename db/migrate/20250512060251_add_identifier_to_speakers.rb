class AddIdentifierToSpeakers < ActiveRecord::Migration[8.0]
  def change
    add_column :speakers, :identifier, :string
    add_index :speakers, [:identifier], :unique => true    
  end
end
