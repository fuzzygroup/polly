class Poll < ApplicationRecord
  belongs_to :share_code
  belongs_to :user
  belongs_to :organization
  
  has_many :poll_options
  
  IDENTITY_RELATIONSHIP = :all # could also be :all
  IDENTITY_COLUMNS = [:name, :user_id]
  
  include FindOrCreate
  include ShareCodeConcern
  
  before_validation :generate_slug, on: :create

  validates :slug, presence: true, uniqueness: true

  def to_param
    slug
  end

  private

  def generate_slug
    struct = OpenStruct.new(user_id: poll_struct.user_id, organization_id: poll_struct.organization_id)
    status, sc = ShareCode.find_or_create(struct)
    self.slug = sc.share_code
    # if title.present? && slug.blank?
    #   self.slug = title.parameterize
    #   ensure_unique_slug
    # end
  end

  def ensure_unique_slug
    base_slug = self.slug
    counter = 2
    while Poll.exists?(slug: self.slug)
      self.slug = "#{base_slug}-#{counter}"
      counter += 1
    end
  end
  
  #before_save :set_share_code
  
  def self.attend_517
    Poll.where(name: 'attend_517').first
  end
  
  def add_option(name, widget_type, value, body)
    poll_struct = OpenStruct.new(
      name: name, 
      poll_id: self.id,
      widget_type: widget_type, 
      value: value,
      body: body
    )
    status, poll_option = PollOption.find_or_create(poll_struct)
  end
end
