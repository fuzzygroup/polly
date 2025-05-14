require "test_helper"

class EventVolunteersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_volunteer = event_volunteers(:one)
  end

  test "should get index" do
    get event_volunteers_url
    assert_response :success
  end

  test "should get new" do
    get new_event_volunteer_url
    assert_response :success
  end

  test "should create event_volunteer" do
    assert_difference("EventVolunteer.count") do
      post event_volunteers_url, params: { event_volunteer: { email: @event_volunteer.email, event_id: @event_volunteer.event_id, first_name: @event_volunteer.first_name, how_do_you_want_to_help: @event_volunteer.how_do_you_want_to_help, last_name: @event_volunteer.last_name, phone_number: @event_volunteer.phone_number, pronouns: @event_volunteer.pronouns, user_id: @event_volunteer.user_id } }
    end

    assert_redirected_to event_volunteer_url(EventVolunteer.last)
  end

  test "should show event_volunteer" do
    get event_volunteer_url(@event_volunteer)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_volunteer_url(@event_volunteer)
    assert_response :success
  end

  test "should update event_volunteer" do
    patch event_volunteer_url(@event_volunteer), params: { event_volunteer: { email: @event_volunteer.email, event_id: @event_volunteer.event_id, first_name: @event_volunteer.first_name, how_do_you_want_to_help: @event_volunteer.how_do_you_want_to_help, last_name: @event_volunteer.last_name, phone_number: @event_volunteer.phone_number, pronouns: @event_volunteer.pronouns, user_id: @event_volunteer.user_id } }
    assert_redirected_to event_volunteer_url(@event_volunteer)
  end

  test "should destroy event_volunteer" do
    assert_difference("EventVolunteer.count", -1) do
      delete event_volunteer_url(@event_volunteer)
    end

    assert_redirected_to event_volunteers_url
  end
end
