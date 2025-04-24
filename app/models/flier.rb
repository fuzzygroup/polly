class Flier < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  belongs_to :group
  belongs_to :project
  
  has_one_attached :image, dependent: :purge_later
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name, :user_id, :created_at]
  include FindOrCreate
  
end
