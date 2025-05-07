json.extract! bank_deposit, :id, :name, :date_collected, :amount, :event_id, :user_id, :organization_id, :funds_type, :notes, :created_at, :updated_at
json.url bank_deposit_url(bank_deposit, format: :json)
