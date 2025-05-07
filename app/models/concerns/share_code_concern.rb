module ShareCodeConcern
  extend ActiveSupport::Concern

  #
  # NOTE: This always fails with a callback error.  
  # Need to dig into in future but not now
  #
  included do
    def set_share_code
      struct = OpenStruct.new(user_id: self.user_id, organization_id: self.organization_id)
      status, sc = ShareCode.find_or_create(struct)
    end
  end
end
