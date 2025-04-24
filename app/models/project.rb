class Project < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  belongs_to :group
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name, :user_id]
  include FindOrCreate
  
  acts_as_votable
  
  def leader
    self.user.full_name
  end
end
