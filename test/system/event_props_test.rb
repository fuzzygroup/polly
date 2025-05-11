require "application_system_test_case"

class EventPropsTest < ApplicationSystemTestCase
  setup do
    @event_prop = event_props(:one)
  end

  test "visiting the index" do
    visit event_props_url
    assert_selector "h1", text: "Event props"
  end

  test "should create event prop" do
    visit event_props_url
    click_on "New event prop"

    fill_in "Body", with: @event_prop.body
    fill_in "Name", with: @event_prop.name
    fill_in "Organization", with: @event_prop.organization_id
    fill_in "User", with: @event_prop.user_id
    click_on "Create Event prop"

    assert_text "Event prop was successfully created"
    click_on "Back"
  end

  test "should update Event prop" do
    visit event_prop_url(@event_prop)
    click_on "Edit this event prop", match: :first

    fill_in "Body", with: @event_prop.body
    fill_in "Name", with: @event_prop.name
    fill_in "Organization", with: @event_prop.organization_id
    fill_in "User", with: @event_prop.user_id
    click_on "Update Event prop"

    assert_text "Event prop was successfully updated"
    click_on "Back"
  end

  test "should destroy Event prop" do
    visit event_prop_url(@event_prop)
    click_on "Destroy this event prop", match: :first

    assert_text "Event prop was successfully destroyed"
  end
end
