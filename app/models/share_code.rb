class ShareCode < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  #belongs_to :event
  
  IDENTITY_COLUMNS = [:share_code]
  KEY_LENGTH = 10
  
  validates :share_code, uniqueness: true#, case_sensitive: true
  validates_presence_of :user_id, :organization_id
  
  def self.share_code_exists?(struct, db_model = ShareCode)
    params = {}
    params[:share_code] = struct.share_code
    # likely logical error here; share_codes need to BE MOTHER FUCKING UNIQUE
    #params[:user_id] = struct.user_id if struct.user_id
    sc = db_model.where(params).first
    
    return 200, sc if sc
    return 404, nil
  end
  
  #
  # If you pass in a string like elias it will generate one if needed
  # otherwise it generates a tinyurl
  #
  # status, sc = ShareCode.find_or_create(OpenStruct.new(user_id: User.fuzzygroup.id, share_code: "anziani"))
  def self.find_or_create(struct, db_model = ShareCode)
    status, sc = db_model.exists?(struct)
    return status, sc if sc
    
    if struct.share_code.nil?
      sc = db_model.generate_code
      struct.share_code = sc
    end
    
    sc = db_model.new(struct.to_h)
    sc.save
    if sc.persisted?
      return 200, sc
    else
      return 404, sc
    end
  end

  # ShareCode.generate
  # https://www.railscarma.com/blog/technical-articles/simple-way-shorten-long-urls-rails/
  def self.generate_code(db_model = ShareCode)
    new_share_code = SecureRandom.alphanumeric(KEY_LENGTH)
    status, sc = db_model.share_code_exists?(OpenStruct.new(share_code: new_share_code), db_model)
    if status == 200
      return self.generate_code
    end
    new_share_code
  end
  
  # Since I can't seem to remember my own syntax ...
  class << self  
    alias_method :generate, :generate_code
  end  
  
  # ApiKey.generate
  # https://www.railscarma.com/blog/technical-articles/simple-way-shorten-long-urls-rails/
  # def self.generate_key
  #   new_api_key = SecureRandom.alphanumeric(KEY_LENGTH)
  #   if ApiKey.exists?(api_key: new_api_key)
  #     return self.generate_key
  #   end
  #   new_api_key
  # end
  

  def self.make(user_id, share_code=nil)
    share_code = ShareCode.generate_key if share_code.nil?

    new_share_code = ShareCode.create(
      user_id: user_id,
      share_code: share_code
    )
    if new_share_code.new_record?
      raise new_share_code.errors.full_messages.join("\n")
    end
    new_share_code
  end
end


# # == Schema Information
# #
# # Table name: share_codes
# #
# #  id         :bigint           not null, primary key
# #  share_code :string
# #  created_at :datetime         not null
# #  updated_at :datetime         not null
# #  user_id    :bigint
# #
# # Indexes
# #
# #  index_share_codes_on_share_code  (share_code) UNIQUE
# #  index_share_codes_on_user_id     (user_id)
# #
# # Foreign Keys
# #
# #  fk_rails_...  (user_id => users.id)
# #
# class ShareCode < ApplicationRecord
#   belongs_to :user
#
#   # Broadcast changes in realtime with Hotwire
#   after_create_commit  -> { broadcast_prepend_later_to :share_codes, partial: "share_codes/index", locals: { share_code: self } }
#   after_update_commit  -> { broadcast_replace_later_to self }
#   after_destroy_commit -> { broadcast_remove_to :share_codes, target: dom_id(self, :index) }
#
#   #########################################################################
#   #
#   # class level directives
#   #
#   #########################################################################
#   #paginates_per 20
#   IDENTITY_COLUMNS = [:share_code]
#   KEY_LENGTH = 10
#
#   #########################################################################
#   #
#   # attr_accessible / attr_accessor / attr_reader / attr_writer
#   #
#   #########################################################################
#   #attr_accessor :date_created
#
#   #########################################################################
#   #
#   # validations
#   #
#   #########################################################################
#
#   #validates_uniqueness_of
#   #validates_presence_of
#   validates :share_code, uniqueness: true#, case_sensitive: true
#   validates_presence_of :user_id
#
#
#   #########################################################################
#   #
#   # belongs_to
#   #
#   #########################################################################
#   belongs_to :user
#
#   #########################################################################
#   #
#   # has_many
#   #
#   #########################################################################
#
#
#   #########################################################################
#   #
#   # call backs
#   #
#   #########################################################################
#
#
#   #########################################################################
#   #
#   # scopes
#   #
#   #########################################################################
#
#
#   #########################################################################
#   #
#   # CLASS METHODS
#   #
#   #########################################################################
#
#   def self.share_code_exists?(struct, db_model = ShareCode)
#     params = {}
#     params[:share_code] = struct.share_code
#     # likely logical error here; share_codes need to BE MOTHER FUCKING UNIQUE
#     #params[:user_id] = struct.user_id if struct.user_id
#     sc = db_model.where(params).first
#
#     return 200, sc if sc
#     return 404, nil
#   end
#
#   #
#   # If you pass in a string like elias it will generate one if needed
#   # otherwise it generates a tinyurl
#   #
#   # status, sc = ShareCode.find_or_create(OpenStruct.new(user_id: User.fuzzygroup.id, share_code: "anziani"))
#   def self.find_or_create(struct, db_model = ShareCode)
#     status, sc = db_model.exists?(struct)
#     return status, sc if sc
#
#     if struct.share_code.nil?
#       sc = db_model.generate_code
#       struct.share_code = sc
#     end
#
#     sc = db_model.new(struct.to_h)
#     sc.save
#     if sc.persisted?
#       return 200, sc
#     else
#       return 404, sc
#     end
#   end
#
#   # ShareCode.generate
#   # https://www.railscarma.com/blog/technical-articles/simple-way-shorten-long-urls-rails/
#   def self.generate_code(db_model = ShareCode)
#     new_share_code = SecureRandom.alphanumeric(KEY_LENGTH)
#     status, sc = db_model.share_code_exists?(OpenStruct.new(share_code: new_share_code), db_model)
#     if status == 200
#       return self.generate_code
#     end
#     new_share_code
#   end
#
#   # Since I can't seem to remember my own syntax ...
#   class << self
#     alias_method :generate, :generate_code
#   end
#
#   # ApiKey.generate
#   # https://www.railscarma.com/blog/technical-articles/simple-way-shorten-long-urls-rails/
#   # def self.generate_key
#   #   new_api_key = SecureRandom.alphanumeric(KEY_LENGTH)
#   #   if ApiKey.exists?(api_key: new_api_key)
#   #     return self.generate_key
#   #   end
#   #   new_api_key
#   # end
#
#
#   def self.make(user_id, share_code=nil)
#     share_code = ShareCode.generate_key if share_code.nil?
#
#     new_share_code = ShareCode.create(
#       user_id: user_id,
#       share_code: share_code
#     )
#     if new_share_code.new_record?
#       raise new_share_code.errors.full_messages.join("\n")
#     end
#     new_share_code
#   end
#
#   #def self.exists?(struct)
#   #  where_clauses = []
#   #  IDENTITY_COLUMNS.each do |identity_column|
#   #    where_clauses << {identity_column => struct.send(identity_column)}
#   #  end
#   ##  #raise where_clauses.inspect
#    # obj = self.where(where_clauses.first).first
#    # if obj
#    #   return true, obj
#    # end
#    # return false, nil
#   #end
#
#  # def self.find_or_create(struct)
#  #   exists, ak = self.exists?(struct)
#  #   return ak if bkm
#  #   #debugger
#  #   ak = self.new(struct.to_h)
# #
#   #  ak.save
#   #  if ak.persisted?
#  #     return 200, ak
#  #   else
#  #     raise 500, ak#.errors.full_messages.inspect
#  #   end
#  #
#  # end
#
#
#   #########################################################################
#   #
#   # INSTANCE METHODS
#   #
#   #########################################################################
#
#
#   #########################################################################
#   #
#   # PRIVATE METHODS
#   #
#   #########################################################################
#
#   private
#
#   #########################################################################
#   #
#   # PROTECTED METHODS
#   #
#   #########################################################################
#
#   protected
# end
