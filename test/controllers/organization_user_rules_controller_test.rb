require "test_helper"

class OrganizationUserRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization_user_rule = organization_user_rules(:one)
  end

  test "should get index" do
    get organization_user_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_organization_user_rule_url
    assert_response :success
  end

  test "should create organization_user_rule" do
    assert_difference("OrganizationUserRule.count") do
      post organization_user_rules_url, params: { organization_user_rule: { organization_id: @organization_user_rule.organization_id, rule_id: @organization_user_rule.rule_id, user_id: @organization_user_rule.user_id } }
    end

    assert_redirected_to organization_user_rule_url(OrganizationUserRule.last)
  end

  test "should show organization_user_rule" do
    get organization_user_rule_url(@organization_user_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_organization_user_rule_url(@organization_user_rule)
    assert_response :success
  end

  test "should update organization_user_rule" do
    patch organization_user_rule_url(@organization_user_rule), params: { organization_user_rule: { organization_id: @organization_user_rule.organization_id, rule_id: @organization_user_rule.rule_id, user_id: @organization_user_rule.user_id } }
    assert_redirected_to organization_user_rule_url(@organization_user_rule)
  end

  test "should destroy organization_user_rule" do
    assert_difference("OrganizationUserRule.count", -1) do
      delete organization_user_rule_url(@organization_user_rule)
    end

    assert_redirected_to organization_user_rules_url
  end
end
