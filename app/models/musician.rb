class Musician < ApplicationRecord
  belongs_to :user
  belongs_to :contact_card, optional: true
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:identifier] #, :contact_card_id
  include FindOrCreate
  
  def self.jen_carlson_midkiff
    Musician.where(identifier: 'jen_carlson_midkiff').first
  end
  
  def self.dave_mccarty
    Musician.where(identifier: 'dave_mccarty').first
  end
  
  def self.greg_ziesemer
    Musician.where(identifier: 'greg_ziesemer').first    
  end
  
  def self.james
    Musician.where(identifier: 'james').first    
  end
  
  def self.tbd
    Musician.where(identifier: "tbd").first
  end
  
end
