require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "should create event" do
    visit events_url
    click_on "New event"

    fill_in "Body", with: @event.body
    fill_in "Date end", with: @event.date_end
    fill_in "Date start", with: @event.date_start
    fill_in "Event type", with: @event.event_type_id
    check "Has musicians" if @event.has_musicians
    check "Has partners" if @event.has_partners
    check "Has props" if @event.has_props
    check "Has speakers" if @event.has_speakers
    fill_in "Location", with: @event.location
    fill_in "Name", with: @event.name
    fill_in "Organization", with: @event.organization_id
    fill_in "Share code", with: @event.share_code_id
    fill_in "Time end", with: @event.time_end
    fill_in "Time start", with: @event.time_start
    fill_in "User", with: @event.user_id
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "should update Event" do
    visit event_url(@event)
    click_on "Edit this event", match: :first

    fill_in "Body", with: @event.body
    fill_in "Date end", with: @event.date_end
    fill_in "Date start", with: @event.date_start
    fill_in "Event type", with: @event.event_type_id
    check "Has musicians" if @event.has_musicians
    check "Has partners" if @event.has_partners
    check "Has props" if @event.has_props
    check "Has speakers" if @event.has_speakers
    fill_in "Location", with: @event.location
    fill_in "Name", with: @event.name
    fill_in "Organization", with: @event.organization_id
    fill_in "Share code", with: @event.share_code_id
    fill_in "Time end", with: @event.time_end.to_s
    fill_in "Time start", with: @event.time_start.to_s
    fill_in "User", with: @event.user_id
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "should destroy Event" do
    visit event_url(@event)
    click_on "Destroy this event", match: :first

    assert_text "Event was successfully destroyed"
  end
end
