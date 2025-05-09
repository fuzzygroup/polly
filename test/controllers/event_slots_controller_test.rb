require "test_helper"

class EventSlotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_slot = event_slots(:one)
  end

  test "should get index" do
    get event_slots_url
    assert_response :success
  end

  test "should get new" do
    get new_event_slot_url
    assert_response :success
  end

  test "should create event_slot" do
    assert_difference("EventSlot.count") do
      post event_slots_url, params: { event_slot: { body: @event_slot.body, computed_start_at: @event_slot.computed_start_at, duration: @event_slot.duration, event_id: @event_slot.event_id, event_slot_type_id: @event_slot.event_slot_type_id, name: @event_slot.name, speaker_id: @event_slot.speaker_id } }
    end

    assert_redirected_to event_slot_url(EventSlot.last)
  end

  test "should show event_slot" do
    get event_slot_url(@event_slot)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_slot_url(@event_slot)
    assert_response :success
  end

  test "should update event_slot" do
    patch event_slot_url(@event_slot), params: { event_slot: { body: @event_slot.body, computed_start_at: @event_slot.computed_start_at, duration: @event_slot.duration, event_id: @event_slot.event_id, event_slot_type_id: @event_slot.event_slot_type_id, name: @event_slot.name, speaker_id: @event_slot.speaker_id } }
    assert_redirected_to event_slot_url(@event_slot)
  end

  test "should destroy event_slot" do
    assert_difference("EventSlot.count", -1) do
      delete event_slot_url(@event_slot)
    end

    assert_redirected_to event_slots_url
  end
end
