class Musician < ApplicationRecord
  belongs_to :user
  belongs_to :contact_card
end
