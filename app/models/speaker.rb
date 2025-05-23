class Speaker < ApplicationRecord
  belongs_to :organization, optional: true
  belongs_to :user
  belongs_to :contact_card, optional: true
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name, :organization_id] #, :contact_card_id
  include FindOrCreate
  
  def self.scott_johnson
    Speaker.where(identifier: "scott_johnson").first
  end

  def self.scott
    Speaker.where(identifier: "scott_johnson").first
  end

  
  def self.captain_crunch
    Speaker.where(identifier: "captain_crunch").first
  end
  
  def self.max_haddad
    Speaker.where(identifier: "max_haddad").first
  end
  
  def self.resisting_oracle
    Speaker.where(identifier: "resisting_oracle").first
  end
  
  def self.brian_jonasen
    Speaker.where(identifier: "brian_jonasen").first
  end
  
  def self.amy_k
    Speaker.where(identifier: "amy_k").first
  end
  
  def self.tbd
    Speaker.where(identifier: "TBD").first
  end

  def self.open_mic
    Speaker.where(identifier: "open_mic").first
  end
  
  def self.sally
    Speaker.where(identifier: "sally").first
  end
  
  def self.jackson_franklin
    Speaker.where(identifier: 'jackson_franklin').first
  end
  
  def full_name
    name
  end

  
end
