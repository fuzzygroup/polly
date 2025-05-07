class Organization < ApplicationRecord
  
  #
  # Scott Changes from Here On
  #
  IDENTITY_RELATIONSHIP = :any # could also be :all
  IDENTITY_COLUMNS = [:identifier]
  include FindOrCreate
  
  has_many :rules
  has_many :organization_rules
  
  def self.indiana50501
    Organization.where(identifier: "indiana50501").first
  end
  
  def self.nwitakesaction
    Organization.where(identifier: "nwitakesaction").first
  end

  def self.district_9_50501
    Organization.where(identifier: "nwitakesaction").first
  end
  
  def self.district_8_50501
    Organization.where(identifier: "evansville_resistance_district_8_50501").first
  end
  
  def self.westsidedemocrats
    Organization.where(identifier: "westsidedemocrats").first
  end
end
