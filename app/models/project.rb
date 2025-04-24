class Project < ApplicationRecord
  belongs_to :organization
  belongs_to :user
  #belongs_to :group
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name, :user_id]
  include FindOrCreate
  
  acts_as_votable
  
  scope :active, -> { where(active: true) }
  
  def leader
    self.user.full_name
  end
  
  def full_name
    "#{self.project_type} :: #{self.name}"
  end
end
