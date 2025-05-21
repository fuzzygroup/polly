class User < ApplicationRecord
  
  #belongs_to :team_user
  #belongs_to :team
  has_many :teams
  has_many :team_users
  
  #
  # Scott Changes from Here On
  #
  IDENTITY_RELATIONSHIP = :any # could also be :all
  IDENTITY_COLUMNS = [:username]
  include FindOrCreate
  
  
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  # validates :email, presence: true, uniqueness: true
  # validates :password, presence: true
  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :password, length: { maximum: 20 }
  validate :valid_date?

  enum :role, { user: "user", admin: "admin", volunteer: "volunteer", superuser: "superuser" }
  validates :role, inclusion: { in: roles.keys }
  
  belongs_to :organization
  
  acts_as_voter
  
  # Skip confirmation email on creation if needed
  def skip_confirmation_email!
    self.skip_confirmation_notification!
    self.confirmed_at = Time.current # Optional: auto-confirm
  end
  
  
  def has_destroy_rights?(obj)
    return true if self.is_superuser?
    return true if self.id == obj.user_id
  end
  
  def is_admin?
    return true if self.role == 'admin'
    return true if self.role == 'superuser'
  end
  
  def teams_i_created
    self.teams.active
  end
  
  def teams_i_participate_in
    self.team_users.active.map(&:team)
  end
  
  def all_my_teams
    (teams_i_created + teams_i_participate_in).uniq.sort_by { |u| u.name.downcase }
  end
  
  def is_not_superuser?
    return true unless self.role == 'superuser'
  end
  
  def is_superuser?
    return true if self.role == 'superuser'
  end
  



  def full_name
    [ first_name, last_name ].join(" ")
  end

  def super_admin?
    admin? && email == ENV["ADMIN_EMAIL"]
  end
  
  def self.fuzzygroup
    User.where(username: 'fuzzygroup').first
  end
  
  def self.scott
    User.where(username: 'fuzzygroup').first
  end

  def self.helpful_hippie
    User.where(username: 'helpfulhippie').first
  end
  
  def self.helpfulhippie
    User.where(username: 'helpfulhippie').first
  end
  
  def self.hippie
    User.where(username: 'helpfulhippie').first
  end
  
  def self.taelar
    User.where(username: 'taelar').first
  end

  def self.morgan
    User.where(username: 'morgan').first
  end
  
  def self.brian
    User.where(username: 'brian').first
  end
  
  def self.sara
    User.where(username: 'sara').first
  end
  
  def self.jacqui
    User.where(username: 'Jacqui').first
  end
  
  def self.tori
    User.where(username: 'tori').first
  end

  def self.amyk
    User.where(username: 'amyk').first
  end

  def self.janet
    User.where(username: 'janet').first
  end

  def self.pride
    User.where(username: 'pride').first
  end
  
  def self.belladonna 
    User.where(username: 'belladonna').first
  end

  def self.resisting_oracle 
    User.where(username: 'resisting_oracle').first
  end

  def self.dgl 
    User.where(username: 'dgl').first
  end
  
  def self.max_haddad
    User.where(username: 'maxhaddad').first
  end
  
  def self.alex_hardy
    User.where(username: "captaincrunch").first
  end
  
  def self.ryan
    User.where(username: "ryan").first
  end
  
  def self.angie_foreman
    User.where(username: "angie").first
  end

  def self.jen_carlson_midkiff
    User.where(username: "jenmidkiff").first
  end

  def self.jacqui
    User.where(username: "jacqui").first
  end


  private

  def valid_date?
    if date_of_birth.present? && date_of_birth > Time.now.ago(15.years)
      errors.add(:date_of_birth, "must be at least 15 years old")
    end
  end
end
