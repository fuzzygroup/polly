require "application_system_test_case"

class OrganizationRulesTest < ApplicationSystemTestCase
  setup do
    @organization_rule = organization_rules(:one)
  end

  test "visiting the index" do
    visit organization_rules_url
    assert_selector "h1", text: "Organization rules"
  end

  test "should create organization rule" do
    visit organization_rules_url
    click_on "New organization rule"

    check "Active" if @organization_rule.active
    fill_in "Organization", with: @organization_rule.organization_id
    fill_in "Rule", with: @organization_rule.rule_id
    click_on "Create Organization rule"

    assert_text "Organization rule was successfully created"
    click_on "Back"
  end

  test "should update Organization rule" do
    visit organization_rule_url(@organization_rule)
    click_on "Edit this organization rule", match: :first

    check "Active" if @organization_rule.active
    fill_in "Organization", with: @organization_rule.organization_id
    fill_in "Rule", with: @organization_rule.rule_id
    click_on "Update Organization rule"

    assert_text "Organization rule was successfully updated"
    click_on "Back"
  end

  test "should destroy Organization rule" do
    visit organization_rule_url(@organization_rule)
    click_on "Destroy this organization rule", match: :first

    assert_text "Organization rule was successfully destroyed"
  end
end
