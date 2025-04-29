require "application_system_test_case"

class RulesTest < ApplicationSystemTestCase
  setup do
    @rule = rules(:one)
  end

  test "visiting the index" do
    visit rules_url
    assert_selector "h1", text: "Rules"
  end

  test "should create rule" do
    visit rules_url
    click_on "New rule"

    check "Active" if @rule.active
    fill_in "Body", with: @rule.body
    fill_in "Name", with: @rule.name
    fill_in "Notes", with: @rule.notes
    fill_in "Organization", with: @rule.organization_id
    fill_in "Team", with: @rule.team_id
    fill_in "User", with: @rule.user_id
    click_on "Create Rule"

    assert_text "Rule was successfully created"
    click_on "Back"
  end

  test "should update Rule" do
    visit rule_url(@rule)
    click_on "Edit this rule", match: :first

    check "Active" if @rule.active
    fill_in "Body", with: @rule.body
    fill_in "Name", with: @rule.name
    fill_in "Notes", with: @rule.notes
    fill_in "Organization", with: @rule.organization_id
    fill_in "Team", with: @rule.team_id
    fill_in "User", with: @rule.user_id
    click_on "Update Rule"

    assert_text "Rule was successfully updated"
    click_on "Back"
  end

  test "should destroy Rule" do
    visit rule_url(@rule)
    click_on "Destroy this rule", match: :first

    assert_text "Rule was successfully destroyed"
  end
end
