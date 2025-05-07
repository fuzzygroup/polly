class CreateBankDeposits < ActiveRecord::Migration[8.0]
  def change
    create_table :bank_deposits do |t|
      t.string :name
      t.date :date_collected
      t.decimal :amount
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.references :organization, foreign_key: true
      t.string :funds_type
      t.text :notes

      t.timestamps
    end
  end
end
