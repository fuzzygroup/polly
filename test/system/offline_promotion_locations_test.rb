require "application_system_test_case"

class OfflinePromotionLocationsTest < ApplicationSystemTestCase
  setup do
    @offline_promotion_location = offline_promotion_locations(:one)
  end

  test "visiting the index" do
    visit offline_promotion_locations_url
    assert_selector "h1", text: "Offline promotion locations"
  end

  test "should create offline promotion location" do
    visit offline_promotion_locations_url
    click_on "New offline promotion location"

    fill_in "Contact card", with: @offline_promotion_location.contact_card_id
    fill_in "Name", with: @offline_promotion_location.name
    click_on "Create Offline promotion location"

    assert_text "Offline promotion location was successfully created"
    click_on "Back"
  end

  test "should update Offline promotion location" do
    visit offline_promotion_location_url(@offline_promotion_location)
    click_on "Edit this offline promotion location", match: :first

    fill_in "Contact card", with: @offline_promotion_location.contact_card_id
    fill_in "Name", with: @offline_promotion_location.name
    click_on "Update Offline promotion location"

    assert_text "Offline promotion location was successfully updated"
    click_on "Back"
  end

  test "should destroy Offline promotion location" do
    visit offline_promotion_location_url(@offline_promotion_location)
    click_on "Destroy this offline promotion location", match: :first

    assert_text "Offline promotion location was successfully destroyed"
  end
end
