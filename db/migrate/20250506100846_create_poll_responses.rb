class CreatePollResponses < ActiveRecord::Migration[8.0]
  def change
    create_table :poll_responses do |t|
      t.references :poll, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
