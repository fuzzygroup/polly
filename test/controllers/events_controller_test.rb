require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    assert_difference("Event.count") do
      post events_url, params: { event: { body: @event.body, date_end: @event.date_end, date_start: @event.date_start, event_type_id: @event.event_type_id, has_musicians: @event.has_musicians, has_partners: @event.has_partners, has_props: @event.has_props, has_speakers: @event.has_speakers, location: @event.location, name: @event.name, organization_id: @event.organization_id, share_code_id: @event.share_code_id, time_end: @event.time_end, time_start: @event.time_start, user_id: @event.user_id } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { body: @event.body, date_end: @event.date_end, date_start: @event.date_start, event_type_id: @event.event_type_id, has_musicians: @event.has_musicians, has_partners: @event.has_partners, has_props: @event.has_props, has_speakers: @event.has_speakers, location: @event.location, name: @event.name, organization_id: @event.organization_id, share_code_id: @event.share_code_id, time_end: @event.time_end, time_start: @event.time_start, user_id: @event.user_id } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference("Event.count", -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
