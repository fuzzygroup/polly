class VettingQuestion < ApplicationRecord
  
  #
  # Scott Changes from Here On
  #
  IDENTITY_RELATIONSHIP = :any # could also be :all
  IDENTITY_COLUMNS = [:body]
  include FindOrCreate
  
  #
  # Belongs_to 
  #
  belongs_to :organization
  belongs_to :user
  belongs_to :group, optional: true  
  
  #
  # Gem based includes
  #
  acts_as_votable
  
  # def active
  #   return true unless self.active == false
  # end
end
