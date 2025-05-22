class Speech < ApplicationRecord
  #belongs_to :share_code
  belongs_to :organization
  belongs_to :speaker, optional: true
  belongs_to :user, optional: true
  belongs_to :event
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name, :user_id]

  include FindOrCreate
  #include ShareCodeConcern
  
  
  # BCG should work but doesn't 
  #before_validation :generate_slug, on: :create
  #before_save :generate_slug#, on: :create

  #validates :slug, presence: true, uniqueness: true
  #validates :name, :body, presence: true
  
  #before_validation :generate_slug, on: :create

  #validates :slug, presence: true, uniqueness: true
  
  
  def to_param
    slug
  end
  
  def presentation_title
    if self.event
      date = self.event.date_start.to_s
    else self
      date =self.created_at.to_s
    end
    "#{date} : #{self.name} by #{self.speaker.full_name}"
  end
  
  # def generate_slug
  #   struct = OpenStruct.new(user_id: self.user_id, organization_id: self.organization_id)
  #   status, sc = ShareCode.find_or_create(struct)
  #   self.slug = sc.share_code
  #   # if title.present? && slug.blank?
  #   #   self.slug = title.parameterize
  #   #   ensure_unique_slug
  #   # end
  # end
  #
  # def ensure_unique_slug
  #   base_slug = self.slug
  #   counter = 2
  #   while Poll.exists?(slug: self.slug)
  #     self.slug = "#{base_slug}-#{counter}"
  #     counter += 1
  #   end
  # end
  
  #private
  
  # def generate_slug
  #   struct = OpenStruct.new(user_id: self.user_id, organization_id: self.organization_id)
  #   status, sc = ShareCode.find_or_create(struct)
  #   self.slug = sc.share_code
  #
  #   #self.share_code_id = sc.id
  #   #debugger
  #   # if title.present? && slug.blank?
  #   #   self.slug = title.parameterize
  #   #   ensure_unique_slug
  #   # end
  # end
  
end
