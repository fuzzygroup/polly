require "application_system_test_case"

class EventSlotTypesTest < ApplicationSystemTestCase
  setup do
    @event_slot_type = event_slot_types(:one)
  end

  test "visiting the index" do
    visit event_slot_types_url
    assert_selector "h1", text: "Event slot types"
  end

  test "should create event slot type" do
    visit event_slot_types_url
    click_on "New event slot type"

    fill_in "Default duration", with: @event_slot_type.default_duration
    fill_in "Default duration units", with: @event_slot_type.default_duration_units
    fill_in "Name", with: @event_slot_type.name
    click_on "Create Event slot type"

    assert_text "Event slot type was successfully created"
    click_on "Back"
  end

  test "should update Event slot type" do
    visit event_slot_type_url(@event_slot_type)
    click_on "Edit this event slot type", match: :first

    fill_in "Default duration", with: @event_slot_type.default_duration
    fill_in "Default duration units", with: @event_slot_type.default_duration_units
    fill_in "Name", with: @event_slot_type.name
    click_on "Update Event slot type"

    assert_text "Event slot type was successfully updated"
    click_on "Back"
  end

  test "should destroy Event slot type" do
    visit event_slot_type_url(@event_slot_type)
    click_on "Destroy this event slot type", match: :first

    assert_text "Event slot type was successfully destroyed"
  end
end
