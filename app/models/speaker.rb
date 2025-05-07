class Speaker < ApplicationRecord
  belongs_to :organization, optional: true
  belongs_to :user
  belongs_to :contact_card, optional: true
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name, :organization_id, :contact_card_id]
  include FindOrCreate
  
end
