class CreateShareCodes < ActiveRecord::Migration[8.0]
  def change
    create_table :share_codes do |t|
      t.string :share_code
      t.references :user, foreign_key: true
      t.references :organization, foreign_key: true
      t.timestamps
    end
    add_index :share_codes, :share_code, :unique => true
  end
end