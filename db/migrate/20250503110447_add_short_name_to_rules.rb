class AddShortNameToRules < ActiveRecord::Migration[8.0]
  def change
    add_column :rules, :short_name, :string
  end
end