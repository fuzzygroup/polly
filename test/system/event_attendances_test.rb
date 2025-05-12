require "application_system_test_case"

class EventAttendancesTest < ApplicationSystemTestCase
  setup do
    @event_attendance = event_attendances(:one)
  end

  test "visiting the index" do
    visit event_attendances_url
    assert_selector "h1", text: "Event attendances"
  end

  test "should create event attendance" do
    visit event_attendances_url
    click_on "New event attendance"

    fill_in "Event", with: @event_attendance.event_id
    fill_in "Ip address", with: @event_attendance.ip_address
    fill_in "Name", with: @event_attendance.name
    fill_in "Organization", with: @event_attendance.organization_id
    check "Status" if @event_attendance.status
    fill_in "User agent", with: @event_attendance.user_agent
    fill_in "User", with: @event_attendance.user_id
    click_on "Create Event attendance"

    assert_text "Event attendance was successfully created"
    click_on "Back"
  end

  test "should update Event attendance" do
    visit event_attendance_url(@event_attendance)
    click_on "Edit this event attendance", match: :first

    fill_in "Event", with: @event_attendance.event_id
    fill_in "Ip address", with: @event_attendance.ip_address
    fill_in "Name", with: @event_attendance.name
    fill_in "Organization", with: @event_attendance.organization_id
    check "Status" if @event_attendance.status
    fill_in "User agent", with: @event_attendance.user_agent
    fill_in "User", with: @event_attendance.user_id
    click_on "Update Event attendance"

    assert_text "Event attendance was successfully updated"
    click_on "Back"
  end

  test "should destroy Event attendance" do
    visit event_attendance_url(@event_attendance)
    click_on "Destroy this event attendance", match: :first

    assert_text "Event attendance was successfully destroyed"
  end
end
