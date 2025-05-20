require "application_system_test_case"

class OrganizationRolesTest < ApplicationSystemTestCase
  setup do
    @organization_role = organization_roles(:one)
  end

  test "visiting the index" do
    visit organization_roles_url
    assert_selector "h1", text: "Organization roles"
  end

  test "should create organization role" do
    visit organization_roles_url
    click_on "New organization role"

    fill_in "Job description", with: @organization_role.job_description
    fill_in "Name", with: @organization_role.name
    fill_in "Status", with: @organization_role.status
    fill_in "Team", with: @organization_role.team_id
    fill_in "User", with: @organization_role.user_id
    click_on "Create Organization role"

    assert_text "Organization role was successfully created"
    click_on "Back"
  end

  test "should update Organization role" do
    visit organization_role_url(@organization_role)
    click_on "Edit this organization role", match: :first

    fill_in "Job description", with: @organization_role.job_description
    fill_in "Name", with: @organization_role.name
    fill_in "Status", with: @organization_role.status
    fill_in "Team", with: @organization_role.team_id
    fill_in "User", with: @organization_role.user_id
    click_on "Update Organization role"

    assert_text "Organization role was successfully updated"
    click_on "Back"
  end

  test "should destroy Organization role" do
    visit organization_role_url(@organization_role)
    click_on "Destroy this organization role", match: :first

    assert_text "Organization role was successfully destroyed"
  end
end
