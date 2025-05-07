require "test_helper"

class OrganizationRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @organization_rule = organization_rules(:one)
  end

  test "should get index" do
    get organization_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_organization_rule_url
    assert_response :success
  end

  test "should create organization_rule" do
    assert_difference("OrganizationRule.count") do
      post organization_rules_url, params: { organization_rule: { active: @organization_rule.active, organization_id: @organization_rule.organization_id, rule_id: @organization_rule.rule_id } }
    end

    assert_redirected_to organization_rule_url(OrganizationRule.last)
  end

  test "should show organization_rule" do
    get organization_rule_url(@organization_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_organization_rule_url(@organization_rule)
    assert_response :success
  end

  test "should update organization_rule" do
    patch organization_rule_url(@organization_rule), params: { organization_rule: { active: @organization_rule.active, organization_id: @organization_rule.organization_id, rule_id: @organization_rule.rule_id } }
    assert_redirected_to organization_rule_url(@organization_rule)
  end

  test "should destroy organization_rule" do
    assert_difference("OrganizationRule.count", -1) do
      delete organization_rule_url(@organization_rule)
    end

    assert_redirected_to organization_rules_url
  end
end
