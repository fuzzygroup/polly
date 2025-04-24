require "test_helper"

class FliersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flier = fliers(:one)
  end

  test "should get index" do
    get fliers_url
    assert_response :success
  end

  test "should get new" do
    get new_flier_url
    assert_response :success
  end

  test "should create flier" do
    assert_difference("Flier.count") do
      post fliers_url, params: { flier: { group_id: @flier.group_id, organization_id: @flier.organization_id, project_id: @flier.project_id, title: @flier.title, user_id: @flier.user_id } }
    end

    assert_redirected_to flier_url(Flier.last)
  end

  test "should show flier" do
    get flier_url(@flier)
    assert_response :success
  end

  test "should get edit" do
    get edit_flier_url(@flier)
    assert_response :success
  end

  test "should update flier" do
    patch flier_url(@flier), params: { flier: { group_id: @flier.group_id, organization_id: @flier.organization_id, project_id: @flier.project_id, title: @flier.title, user_id: @flier.user_id } }
    assert_redirected_to flier_url(@flier)
  end

  test "should destroy flier" do
    assert_difference("Flier.count", -1) do
      delete flier_url(@flier)
    end

    assert_redirected_to fliers_url
  end
end
