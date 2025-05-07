class Team < ApplicationRecord
  
  #
  # Scott Changes from Here On
  #
  IDENTITY_RELATIONSHIP = :any # could also be :all
  IDENTITY_COLUMNS = [:name]
  include FindOrCreate
  
  def new
    self.organization = current_user.organization_id:
  end
  
  
  belongs_to :organization
  belongs_to :user
  
  has_many :team_rules
  
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
