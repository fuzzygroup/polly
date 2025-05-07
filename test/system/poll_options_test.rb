require "application_system_test_case"

class PollOptionsTest < ApplicationSystemTestCase
  setup do
    @poll_option = poll_options(:one)
  end

  test "visiting the index" do
    visit poll_options_url
    assert_selector "h1", text: "Poll options"
  end

  test "should create poll option" do
    visit poll_options_url
    click_on "New poll option"

    fill_in "Body", with: @poll_option.body
    fill_in "Name", with: @poll_option.name
    fill_in "Poll", with: @poll_option.poll_id
    fill_in "Value", with: @poll_option.value
    fill_in "Widget type", with: @poll_option.widget_type
    click_on "Create Poll option"

    assert_text "Poll option was successfully created"
    click_on "Back"
  end

  test "should update Poll option" do
    visit poll_option_url(@poll_option)
    click_on "Edit this poll option", match: :first

    fill_in "Body", with: @poll_option.body
    fill_in "Name", with: @poll_option.name
    fill_in "Poll", with: @poll_option.poll_id
    fill_in "Value", with: @poll_option.value
    fill_in "Widget type", with: @poll_option.widget_type
    click_on "Update Poll option"

    assert_text "Poll option was successfully updated"
    click_on "Back"
  end

  test "should destroy Poll option" do
    visit poll_option_url(@poll_option)
    click_on "Destroy this poll option", match: :first

    assert_text "Poll option was successfully destroyed"
  end
end
