class AddPronounsToContactCards < ActiveRecord::Migration[8.0]
  def change
    add_column :contact_cards, :pronoun, :string
  end
end