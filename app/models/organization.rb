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
  
  def self.westside_democrats
    Organization.where(identifier: "westsidedemocrats").first
  end

  def self.westfield_democrats
    Organization.where(identifier: "westfield_democrats").first
  end
  
  def self.we_are_folking_mad
    Organization.where(identifier: "we_are_folking_mad").first
  end
  
  def self.indiana50501_district8_evansville_resistance
    Organization.where(identifier: "indiana50501_district8_evansville_resistance").first
  end

end
