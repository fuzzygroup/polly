require "application_system_test_case"

class TeamRulesTest < ApplicationSystemTestCase
  setup do
    @team_rule = team_rules(:one)
  end

  test "visiting the index" do
    visit team_rules_url
    assert_selector "h1", text: "Team rules"
  end

  test "should create team rule" do
    visit team_rules_url
    click_on "New team rule"

    check "Active" if @team_rule.active
    fill_in "Rule", with: @team_rule.rule_id
    fill_in "Team", with: @team_rule.team_id
    click_on "Create Team rule"

    assert_text "Team rule was successfully created"
    click_on "Back"
  end

  test "should update Team rule" do
    visit team_rule_url(@team_rule)
    click_on "Edit this team rule", match: :first

    check "Active" if @team_rule.active
    fill_in "Rule", with: @team_rule.rule_id
    fill_in "Team", with: @team_rule.team_id
    click_on "Update Team rule"

    assert_text "Team rule was successfully updated"
    click_on "Back"
  end

  test "should destroy Team rule" do
    visit team_rule_url(@team_rule)
    click_on "Destroy this team rule", match: :first

    assert_text "Team rule was successfully destroyed"
  end
end
