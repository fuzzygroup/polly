require "test_helper"

class ContactCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_card = contact_cards(:one)
  end

  test "should get index" do
    get contact_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_card_url
    assert_response :success
  end

  test "should create contact_card" do
    assert_difference("ContactCard.count") do
      post contact_cards_url, params: { contact_card: { birth_date: @contact_card.birth_date, birth_year: @contact_card.birth_year, birthday: @contact_card.birthday, city: @contact_card.city, company: @contact_card.company, congressional_district: @contact_card.congressional_district, county: @contact_card.county, discord_server: @contact_card.discord_server, discord_username: @contact_card.discord_username, donor: @contact_card.donor, email_primary: @contact_card.email_primary, email_secondary: @contact_card.email_secondary, favorite_cocktail: @contact_card.favorite_cocktail, favorite_coffee: @contact_card.favorite_coffee, favorite_color: @contact_card.favorite_color, favorite_movie: @contact_card.favorite_movie, first_name: @contact_card.first_name, full_name: @contact_card.full_name, history: @contact_card.history, is_me: @contact_card.is_me, last_name: @contact_card.last_name, needs_attention: @contact_card.needs_attention, notes: @contact_card.notes, organization_id: @contact_card.organization_id, phone_mobile: @contact_card.phone_mobile, phone_secondary: @contact_card.phone_secondary, politician: @contact_card.politician, signal_username: @contact_card.signal_username, state: @contact_card.state, url: @contact_card.url, user_id: @contact_card.user_id, vip: @contact_card.vip } }
    end

    assert_redirected_to contact_card_url(ContactCard.last)
  end

  test "should show contact_card" do
    get contact_card_url(@contact_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_card_url(@contact_card)
    assert_response :success
  end

  test "should update contact_card" do
    patch contact_card_url(@contact_card), params: { contact_card: { birth_date: @contact_card.birth_date, birth_year: @contact_card.birth_year, birthday: @contact_card.birthday, city: @contact_card.city, company: @contact_card.company, congressional_district: @contact_card.congressional_district, county: @contact_card.county, discord_server: @contact_card.discord_server, discord_username: @contact_card.discord_username, donor: @contact_card.donor, email_primary: @contact_card.email_primary, email_secondary: @contact_card.email_secondary, favorite_cocktail: @contact_card.favorite_cocktail, favorite_coffee: @contact_card.favorite_coffee, favorite_color: @contact_card.favorite_color, favorite_movie: @contact_card.favorite_movie, first_name: @contact_card.first_name, full_name: @contact_card.full_name, history: @contact_card.history, is_me: @contact_card.is_me, last_name: @contact_card.last_name, needs_attention: @contact_card.needs_attention, notes: @contact_card.notes, organization_id: @contact_card.organization_id, phone_mobile: @contact_card.phone_mobile, phone_secondary: @contact_card.phone_secondary, politician: @contact_card.politician, signal_username: @contact_card.signal_username, state: @contact_card.state, url: @contact_card.url, user_id: @contact_card.user_id, vip: @contact_card.vip } }
    assert_redirected_to contact_card_url(@contact_card)
  end

  test "should destroy contact_card" do
    assert_difference("ContactCard.count", -1) do
      delete contact_card_url(@contact_card)
    end

    assert_redirected_to contact_cards_url
  end
end
