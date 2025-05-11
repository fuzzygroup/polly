require "test_helper"

class EventPropsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_prop = event_props(:one)
  end

  test "should get index" do
    get event_props_url
    assert_response :success
  end

  test "should get new" do
    get new_event_prop_url
    assert_response :success
  end

  test "should create event_prop" do
    assert_difference("EventProp.count") do
      post event_props_url, params: { event_prop: { body: @event_prop.body, name: @event_prop.name, organization_id: @event_prop.organization_id, user_id: @event_prop.user_id } }
    end

    assert_redirected_to event_prop_url(EventProp.last)
  end

  test "should show event_prop" do
    get event_prop_url(@event_prop)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_prop_url(@event_prop)
    assert_response :success
  end

  test "should update event_prop" do
    patch event_prop_url(@event_prop), params: { event_prop: { body: @event_prop.body, name: @event_prop.name, organization_id: @event_prop.organization_id, user_id: @event_prop.user_id } }
    assert_redirected_to event_prop_url(@event_prop)
  end

  test "should destroy event_prop" do
    assert_difference("EventProp.count", -1) do
      delete event_prop_url(@event_prop)
    end

    assert_redirected_to event_props_url
  end
end
