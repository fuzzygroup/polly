class Team < ApplicationRecord
  
  belongs_to :organization
  belongs_to :user
  belongs_to :event, optional: true
  belongs_to :project, optional: true
  
  has_many :team_users
  has_many :team_rules
  
  scope :active, -> { where(active: true) }
  
  #
  # Scott Changes from Here On
  #
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name]
  include FindOrCreate
  
  def new
    self.organization = current_user.organization_id
  end
  
  def add_creator_as_team_user_and_leader
    self.team_users.new(leader: true, user_id: self.user_id, primary_team_role: "Leadership").save
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
