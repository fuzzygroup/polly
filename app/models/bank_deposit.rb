class BankDeposit < ApplicationRecord
  belongs_to :event
  belongs_to :user
  belongs_to :organization
end
