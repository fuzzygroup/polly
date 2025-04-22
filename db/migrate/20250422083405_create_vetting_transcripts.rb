class CreateVettingTranscripts < ActiveRecord::Migration[8.0]
  def change
    create_table :vetting_transcripts do |t|
      t.string :name
      t.references :organization, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true
      t.string :chat_type
      t.string :chat_user
      t.boolean :active
      t.text :body
      t.jsonb :extracted_objects

      t.timestamps
    end
  end
end
