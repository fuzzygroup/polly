class Rule < ApplicationRecord
  belongs_to :organization, optional: true
  belongs_to :user
  belongs_to :team, optional: true
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:organization_id, :team_id, :short_name]
  include FindOrCreate
  
  def self.non_violence
    Rule.where(short_name: 'non_violence').first
  end 
  
  def self.kindness
    Rule.where(short_name: 'kindness').first
  end  

  def self.good_faith
    Rule.where(short_name: 'good_faith').first
  end  

  def self.not_review
    Rule.where(short_name: 'not_review').first
  end  
  
  def self.not_review
    Rule.where(short_name: 'will_review').first
  end  
  
  def self.entry_closed_after_5_minutes
    Rule.where(short_name: 'entry_closed_after_5_minutes').first
  end  
  
  def self.not_lose_shite_publicly
    Rule.where(short_name: 'not_lose_shite_publicly').first
  end  
  
  def self.not_run_to_national
    Rule.where(short_name: 'not_run_to_national').first
  end  
  
end
