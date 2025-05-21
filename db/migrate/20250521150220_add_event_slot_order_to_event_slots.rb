class AddEventSlotOrderToEventSlots < ActiveRecord::Migration[8.0]
  def change
    add_column :event_slots, :event_slot_order, :integer, default:nil
  end
end
