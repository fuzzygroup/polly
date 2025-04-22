class CreateVettingQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :vetting_questions do |t|
      t.text :body
      t.references :organization, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :group, null: true, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
