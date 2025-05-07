require "application_system_test_case"

class TeamUserRulesTest < ApplicationSystemTestCase
  setup do
    @team_user_rule = team_user_rules(:one)
  end

  test "visiting the index" do
    visit team_user_rules_url
    assert_selector "h1", text: "Team user rules"
  end

  test "should create team user rule" do
    visit team_user_rules_url
    click_on "New team user rule"

    fill_in "Rule", with: @team_user_rule.rule_id
    fill_in "Team", with: @team_user_rule.team_id
    fill_in "User", with: @team_user_rule.user_id
    click_on "Create Team user rule"

    assert_text "Team user rule was successfully created"
    click_on "Back"
  end

  test "should update Team user rule" do
    visit team_user_rule_url(@team_user_rule)
    click_on "Edit this team user rule", match: :first

    fill_in "Rule", with: @team_user_rule.rule_id
    fill_in "Team", with: @team_user_rule.team_id
    fill_in "User", with: @team_user_rule.user_id
    click_on "Update Team user rule"

    assert_text "Team user rule was successfully updated"
    click_on "Back"
  end

  test "should destroy Team user rule" do
    visit team_user_rule_url(@team_user_rule)
    click_on "Destroy this team user rule", match: :first

    assert_text "Team user rule was successfully destroyed"
  end
end
