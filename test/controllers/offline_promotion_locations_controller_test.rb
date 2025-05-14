require "test_helper"

class OfflinePromotionLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offline_promotion_location = offline_promotion_locations(:one)
  end

  test "should get index" do
    get offline_promotion_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_offline_promotion_location_url
    assert_response :success
  end

  test "should create offline_promotion_location" do
    assert_difference("OfflinePromotionLocation.count") do
      post offline_promotion_locations_url, params: { offline_promotion_location: { contact_card_id: @offline_promotion_location.contact_card_id, name: @offline_promotion_location.name } }
    end

    assert_redirected_to offline_promotion_location_url(OfflinePromotionLocation.last)
  end

  test "should show offline_promotion_location" do
    get offline_promotion_location_url(@offline_promotion_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_offline_promotion_location_url(@offline_promotion_location)
    assert_response :success
  end

  test "should update offline_promotion_location" do
    patch offline_promotion_location_url(@offline_promotion_location), params: { offline_promotion_location: { contact_card_id: @offline_promotion_location.contact_card_id, name: @offline_promotion_location.name } }
    assert_redirected_to offline_promotion_location_url(@offline_promotion_location)
  end

  test "should destroy offline_promotion_location" do
    assert_difference("OfflinePromotionLocation.count", -1) do
      delete offline_promotion_location_url(@offline_promotion_location)
    end

    assert_redirected_to offline_promotion_locations_url
  end
end
