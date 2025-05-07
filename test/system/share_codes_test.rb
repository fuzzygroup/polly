require "application_system_test_case"

class ShareCodesTest < ApplicationSystemTestCase
  setup do
    @share_code = share_codes(:one)
  end

  test "visiting the index" do
    visit share_codes_url
    assert_selector "h1", text: "Share codes"
  end

  test "should create share code" do
    visit share_codes_url
    click_on "New share code"

    fill_in "Event", with: @share_code.event_id
    fill_in "Organization", with: @share_code.organization_id
    fill_in "Share code", with: @share_code.share_code
    fill_in "User", with: @share_code.user_id
    click_on "Create Share code"

    assert_text "Share code was successfully created"
    click_on "Back"
  end

  test "should update Share code" do
    visit share_code_url(@share_code)
    click_on "Edit this share code", match: :first

    fill_in "Event", with: @share_code.event_id
    fill_in "Organization", with: @share_code.organization_id
    fill_in "Share code", with: @share_code.share_code
    fill_in "User", with: @share_code.user_id
    click_on "Update Share code"

    assert_text "Share code was successfully updated"
    click_on "Back"
  end

  test "should destroy Share code" do
    visit share_code_url(@share_code)
    click_on "Destroy this share code", match: :first

    assert_text "Share code was successfully destroyed"
  end
end
