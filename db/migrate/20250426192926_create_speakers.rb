class CreateSpeakers < ActiveRecord::Migration[8.0]
  def change
    create_table :speakers do |t|
      t.string :name
      t.text :bio
      t.string :url
      t.string :pronouns
      t.integer :speaking_count
      t.text :notes
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
