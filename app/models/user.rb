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

  private

  def valid_date?
    if date_of_birth.present? && date_of_birth > Time.now.ago(15.years)
      errors.add(:date_of_birth, "must be at least 15 years old")
    end
  end
end
