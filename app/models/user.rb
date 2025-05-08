class User < ApplicationRecord
  
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


  private

  def valid_date?
    if date_of_birth.present? && date_of_birth > Time.now.ago(15.years)
      errors.add(:date_of_birth, "must be at least 15 years old")
    end
  end
end
