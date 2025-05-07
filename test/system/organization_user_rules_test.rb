require "application_system_test_case"

class OrganizationUserRulesTest < ApplicationSystemTestCase
  setup do
    @organization_user_rule = organization_user_rules(:one)
  end

  test "visiting the index" do
    visit organization_user_rules_url
    assert_selector "h1", text: "Organization user rules"
  end

  test "should create organization user rule" do
    visit organization_user_rules_url
    click_on "New organization user rule"

    fill_in "Organization", with: @organization_user_rule.organization_id
    fill_in "Rule", with: @organization_user_rule.rule_id
    fill_in "User", with: @organization_user_rule.user_id
    click_on "Create Organization user rule"

    assert_text "Organization user rule was successfully created"
    click_on "Back"
  end

  test "should update Organization user rule" do
    visit organization_user_rule_url(@organization_user_rule)
    click_on "Edit this organization user rule", match: :first

    fill_in "Organization", with: @organization_user_rule.organization_id
    fill_in "Rule", with: @organization_user_rule.rule_id
    fill_in "User", with: @organization_user_rule.user_id
    click_on "Update Organization user rule"

    assert_text "Organization user rule was successfully updated"
    click_on "Back"
  end

  test "should destroy Organization user rule" do
    visit organization_user_rule_url(@organization_user_rule)
    click_on "Destroy this organization user rule", match: :first

    assert_text "Organization user rule was successfully destroyed"
  end
end
