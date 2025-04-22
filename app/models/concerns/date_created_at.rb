module DateCreatedAt
  extend ActiveSupport::Concern

  #
  # INSTANCE METHODS HERE
  #
  included do
    def set_date_created_at
      self.date_created_at = Date.today
    end
  end
  
end