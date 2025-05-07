require "test_helper"

class TeamUserRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_user_rule = team_user_rules(:one)
  end

  test "should get index" do
    get team_user_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_team_user_rule_url
    assert_response :success
  end

  test "should create team_user_rule" do
    assert_difference("TeamUserRule.count") do
      post team_user_rules_url, params: { team_user_rule: { rule_id: @team_user_rule.rule_id, team_id: @team_user_rule.team_id, user_id: @team_user_rule.user_id } }
    end

    assert_redirected_to team_user_rule_url(TeamUserRule.last)
  end

  test "should show team_user_rule" do
    get team_user_rule_url(@team_user_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_user_rule_url(@team_user_rule)
    assert_response :success
  end

  test "should update team_user_rule" do
    patch team_user_rule_url(@team_user_rule), params: { team_user_rule: { rule_id: @team_user_rule.rule_id, team_id: @team_user_rule.team_id, user_id: @team_user_rule.user_id } }
    assert_redirected_to team_user_rule_url(@team_user_rule)
  end

  test "should destroy team_user_rule" do
    assert_difference("TeamUserRule.count", -1) do
      delete team_user_rule_url(@team_user_rule)
    end

    assert_redirected_to team_user_rules_url
  end
end
