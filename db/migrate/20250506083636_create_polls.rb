class CreatePolls < ActiveRecord::Migration[8.0]
  def change
    create_table :polls do |t|
      t.string :name
      t.references :share_code, foreign_key: true
      t.references :user, foreign_key: true
      t.references :organization, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
