require "test_helper"

class EventSlotTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_slot_type = event_slot_types(:one)
  end

  test "should get index" do
    get event_slot_types_url
    assert_response :success
  end

  test "should get new" do
    get new_event_slot_type_url
    assert_response :success
  end

  test "should create event_slot_type" do
    assert_difference("EventSlotType.count") do
      post event_slot_types_url, params: { event_slot_type: { default_duration: @event_slot_type.default_duration, default_duration_units: @event_slot_type.default_duration_units, name: @event_slot_type.name } }
    end

    assert_redirected_to event_slot_type_url(EventSlotType.last)
  end

  test "should show event_slot_type" do
    get event_slot_type_url(@event_slot_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_slot_type_url(@event_slot_type)
    assert_response :success
  end

  test "should update event_slot_type" do
    patch event_slot_type_url(@event_slot_type), params: { event_slot_type: { default_duration: @event_slot_type.default_duration, default_duration_units: @event_slot_type.default_duration_units, name: @event_slot_type.name } }
    assert_redirected_to event_slot_type_url(@event_slot_type)
  end

  test "should destroy event_slot_type" do
    assert_difference("EventSlotType.count", -1) do
      delete event_slot_type_url(@event_slot_type)
    end

    assert_redirected_to event_slot_types_url
  end
end
