require "test_helper"

class PollOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @poll_option = poll_options(:one)
  end

  test "should get index" do
    get poll_options_url
    assert_response :success
  end

  test "should get new" do
    get new_poll_option_url
    assert_response :success
  end

  test "should create poll_option" do
    assert_difference("PollOption.count") do
      post poll_options_url, params: { poll_option: { body: @poll_option.body, name: @poll_option.name, poll_id: @poll_option.poll_id, value: @poll_option.value, widget_type: @poll_option.widget_type } }
    end

    assert_redirected_to poll_option_url(PollOption.last)
  end

  test "should show poll_option" do
    get poll_option_url(@poll_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_poll_option_url(@poll_option)
    assert_response :success
  end

  test "should update poll_option" do
    patch poll_option_url(@poll_option), params: { poll_option: { body: @poll_option.body, name: @poll_option.name, poll_id: @poll_option.poll_id, value: @poll_option.value, widget_type: @poll_option.widget_type } }
    assert_redirected_to poll_option_url(@poll_option)
  end

  test "should destroy poll_option" do
    assert_difference("PollOption.count", -1) do
      delete poll_option_url(@poll_option)
    end

    assert_redirected_to poll_options_url
  end
end
