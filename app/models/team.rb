class Team < ApplicationRecord
  
  belongs_to :organization
  belongs_to :user
  belongs_to :event, optional: true
  belongs_to :project, optional: true
  
  has_many :team_users
  has_many :team_rules
  
  #
  # Scott Changes from Here On
  #
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name]
  include FindOrCreate
  
  def new
    self.organization = current_user.organization_id
  end
  
  
  
  def self.editable_fields
    #[:]
  end
  
  def self.displayable_fields
  end
  
  # Team.leadership
  def self.leadership
    Team.where(name: 'Leadership', organization_id: Organization.indiana50501.id).first
  end
end
