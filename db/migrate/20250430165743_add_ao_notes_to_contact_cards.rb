class AddAoNotesToContactCards < ActiveRecord::Migration[8.0]
  def change
    add_column :contact_cards, :ao_notes, :text
  end
end