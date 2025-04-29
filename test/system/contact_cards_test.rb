require "application_system_test_case"

class ContactCardsTest < ApplicationSystemTestCase
  setup do
    @contact_card = contact_cards(:one)
  end

  test "visiting the index" do
    visit contact_cards_url
    assert_selector "h1", text: "Contact cards"
  end

  test "should create contact card" do
    visit contact_cards_url
    click_on "New contact card"

    fill_in "Birth date", with: @contact_card.birth_date
    fill_in "Birth year", with: @contact_card.birth_year
    fill_in "Birthday", with: @contact_card.birthday
    fill_in "City", with: @contact_card.city
    fill_in "Company", with: @contact_card.company
    fill_in "Congressional district", with: @contact_card.congressional_district
    fill_in "County", with: @contact_card.county
    fill_in "Discord server", with: @contact_card.discord_server
    fill_in "Discord username", with: @contact_card.discord_username
    check "Donor" if @contact_card.donor
    fill_in "Email primary", with: @contact_card.email_primary
    fill_in "Email secondary", with: @contact_card.email_secondary
    fill_in "Favorite cocktail", with: @contact_card.favorite_cocktail
    fill_in "Favorite coffee", with: @contact_card.favorite_coffee
    fill_in "Favorite color", with: @contact_card.favorite_color
    fill_in "Favorite movie", with: @contact_card.favorite_movie
    fill_in "First name", with: @contact_card.first_name
    fill_in "Full name", with: @contact_card.full_name
    fill_in "History", with: @contact_card.history
    check "Is me" if @contact_card.is_me
    fill_in "Last name", with: @contact_card.last_name
    check "Needs attention" if @contact_card.needs_attention
    fill_in "Notes", with: @contact_card.notes
    fill_in "Organization", with: @contact_card.organization_id
    fill_in "Phone mobile", with: @contact_card.phone_mobile
    fill_in "Phone secondary", with: @contact_card.phone_secondary
    check "Politician" if @contact_card.politician
    fill_in "Signal username", with: @contact_card.signal_username
    fill_in "State", with: @contact_card.state
    fill_in "Url", with: @contact_card.url
    fill_in "User", with: @contact_card.user_id
    check "Vip" if @contact_card.vip
    click_on "Create Contact card"

    assert_text "Contact card was successfully created"
    click_on "Back"
  end

  test "should update Contact card" do
    visit contact_card_url(@contact_card)
    click_on "Edit this contact card", match: :first

    fill_in "Birth date", with: @contact_card.birth_date
    fill_in "Birth year", with: @contact_card.birth_year
    fill_in "Birthday", with: @contact_card.birthday
    fill_in "City", with: @contact_card.city
    fill_in "Company", with: @contact_card.company
    fill_in "Congressional district", with: @contact_card.congressional_district
    fill_in "County", with: @contact_card.county
    fill_in "Discord server", with: @contact_card.discord_server
    fill_in "Discord username", with: @contact_card.discord_username
    check "Donor" if @contact_card.donor
    fill_in "Email primary", with: @contact_card.email_primary
    fill_in "Email secondary", with: @contact_card.email_secondary
    fill_in "Favorite cocktail", with: @contact_card.favorite_cocktail
    fill_in "Favorite coffee", with: @contact_card.favorite_coffee
    fill_in "Favorite color", with: @contact_card.favorite_color
    fill_in "Favorite movie", with: @contact_card.favorite_movie
    fill_in "First name", with: @contact_card.first_name
    fill_in "Full name", with: @contact_card.full_name
    fill_in "History", with: @contact_card.history
    check "Is me" if @contact_card.is_me
    fill_in "Last name", with: @contact_card.last_name
    check "Needs attention" if @contact_card.needs_attention
    fill_in "Notes", with: @contact_card.notes
    fill_in "Organization", with: @contact_card.organization_id
    fill_in "Phone mobile", with: @contact_card.phone_mobile
    fill_in "Phone secondary", with: @contact_card.phone_secondary
    check "Politician" if @contact_card.politician
    fill_in "Signal username", with: @contact_card.signal_username
    fill_in "State", with: @contact_card.state
    fill_in "Url", with: @contact_card.url
    fill_in "User", with: @contact_card.user_id
    check "Vip" if @contact_card.vip
    click_on "Update Contact card"

    assert_text "Contact card was successfully updated"
    click_on "Back"
  end

  test "should destroy Contact card" do
    visit contact_card_url(@contact_card)
    click_on "Destroy this contact card", match: :first

    assert_text "Contact card was successfully destroyed"
  end
end
