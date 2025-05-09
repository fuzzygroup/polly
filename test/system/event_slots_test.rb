require "application_system_test_case"

class EventSlotsTest < ApplicationSystemTestCase
  setup do
    @event_slot = event_slots(:one)
  end

  test "visiting the index" do
    visit event_slots_url
    assert_selector "h1", text: "Event slots"
  end

  test "should create event slot" do
    visit event_slots_url
    click_on "New event slot"

    fill_in "Body", with: @event_slot.body
    fill_in "Computed start at", with: @event_slot.computed_start_at
    fill_in "Duration", with: @event_slot.duration
    fill_in "Event", with: @event_slot.event_id
    fill_in "Event slot type", with: @event_slot.event_slot_type_id
    fill_in "Name", with: @event_slot.name
    fill_in "Speaker", with: @event_slot.speaker_id
    click_on "Create Event slot"

    assert_text "Event slot was successfully created"
    click_on "Back"
  end

  test "should update Event slot" do
    visit event_slot_url(@event_slot)
    click_on "Edit this event slot", match: :first

    fill_in "Body", with: @event_slot.body
    fill_in "Computed start at", with: @event_slot.computed_start_at.to_s
    fill_in "Duration", with: @event_slot.duration
    fill_in "Event", with: @event_slot.event_id
    fill_in "Event slot type", with: @event_slot.event_slot_type_id
    fill_in "Name", with: @event_slot.name
    fill_in "Speaker", with: @event_slot.speaker_id
    click_on "Update Event slot"

    assert_text "Event slot was successfully updated"
    click_on "Back"
  end

  test "should destroy Event slot" do
    visit event_slot_url(@event_slot)
    click_on "Destroy this event slot", match: :first

    assert_text "Event slot was successfully destroyed"
  end
end
