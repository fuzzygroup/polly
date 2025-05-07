require "test_helper"

class ShareCodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @share_code = share_codes(:one)
  end

  test "should get index" do
    get share_codes_url
    assert_response :success
  end

  test "should get new" do
    get new_share_code_url
    assert_response :success
  end

  test "should create share_code" do
    assert_difference("ShareCode.count") do
      post share_codes_url, params: { share_code: { event_id: @share_code.event_id, organization_id: @share_code.organization_id, share_code: @share_code.share_code, user_id: @share_code.user_id } }
    end

    assert_redirected_to share_code_url(ShareCode.last)
  end

  test "should show share_code" do
    get share_code_url(@share_code)
    assert_response :success
  end

  test "should get edit" do
    get edit_share_code_url(@share_code)
    assert_response :success
  end

  test "should update share_code" do
    patch share_code_url(@share_code), params: { share_code: { event_id: @share_code.event_id, organization_id: @share_code.organization_id, share_code: @share_code.share_code, user_id: @share_code.user_id } }
    assert_redirected_to share_code_url(@share_code)
  end

  test "should destroy share_code" do
    assert_difference("ShareCode.count", -1) do
      delete share_code_url(@share_code)
    end

    assert_redirected_to share_codes_url
  end
end
