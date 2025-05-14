class Confirmation < ApplicationRecord
  belongs_to :confirmable, polymorphic: true
  belongs_to :event_slot
end
