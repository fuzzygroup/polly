require "application_system_test_case"

class EventVolunteersTest < ApplicationSystemTestCase
  setup do
    @event_volunteer = event_volunteers(:one)
  end

  test "visiting the index" do
    visit event_volunteers_url
    assert_selector "h1", text: "Event volunteers"
  end

  test "should create event volunteer" do
    visit event_volunteers_url
    click_on "New event volunteer"

    fill_in "Email", with: @event_volunteer.email
    fill_in "Event", with: @event_volunteer.event_id
    fill_in "First name", with: @event_volunteer.first_name
    fill_in "How do you want to help", with: @event_volunteer.how_do_you_want_to_help
    fill_in "Last name", with: @event_volunteer.last_name
    fill_in "Phone number", with: @event_volunteer.phone_number
    fill_in "Pronouns", with: @event_volunteer.pronouns
    fill_in "User", with: @event_volunteer.user_id
    click_on "Create Event volunteer"

    assert_text "Event volunteer was successfully created"
    click_on "Back"
  end

  test "should update Event volunteer" do
    visit event_volunteer_url(@event_volunteer)
    click_on "Edit this event volunteer", match: :first

    fill_in "Email", with: @event_volunteer.email
    fill_in "Event", with: @event_volunteer.event_id
    fill_in "First name", with: @event_volunteer.first_name
    fill_in "How do you want to help", with: @event_volunteer.how_do_you_want_to_help
    fill_in "Last name", with: @event_volunteer.last_name
    fill_in "Phone number", with: @event_volunteer.phone_number
    fill_in "Pronouns", with: @event_volunteer.pronouns
    fill_in "User", with: @event_volunteer.user_id
    click_on "Update Event volunteer"

    assert_text "Event volunteer was successfully updated"
    click_on "Back"
  end

  test "should destroy Event volunteer" do
    visit event_volunteer_url(@event_volunteer)
    click_on "Destroy this event volunteer", match: :first

    assert_text "Event volunteer was successfully destroyed"
  end
end
