class AddKeyPersonToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :key_person, :boolean, default: false
  end
end