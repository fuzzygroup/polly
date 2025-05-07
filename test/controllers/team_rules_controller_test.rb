require "test_helper"

class TeamRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_rule = team_rules(:one)
  end

  test "should get index" do
    get team_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_team_rule_url
    assert_response :success
  end

  test "should create team_rule" do
    assert_difference("TeamRule.count") do
      post team_rules_url, params: { team_rule: { active: @team_rule.active, rule_id: @team_rule.rule_id, team_id: @team_rule.team_id } }
    end

    assert_redirected_to team_rule_url(TeamRule.last)
  end

  test "should show team_rule" do
    get team_rule_url(@team_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_rule_url(@team_rule)
    assert_response :success
  end

  test "should update team_rule" do
    patch team_rule_url(@team_rule), params: { team_rule: { active: @team_rule.active, rule_id: @team_rule.rule_id, team_id: @team_rule.team_id } }
    assert_redirected_to team_rule_url(@team_rule)
  end

  test "should destroy team_rule" do
    assert_difference("TeamRule.count", -1) do
      delete team_rule_url(@team_rule)
    end

    assert_redirected_to team_rules_url
  end
end
