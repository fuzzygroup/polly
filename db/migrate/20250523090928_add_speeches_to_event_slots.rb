class AddSpeechesToEventSlots < ActiveRecord::Migration[8.0]
  def change
    add_reference :event_slots, :speech, foreign_key: true
  end
end
