require "application_system_test_case"

class FliersTest < ApplicationSystemTestCase
  setup do
    @flier = fliers(:one)
  end

  test "visiting the index" do
    visit fliers_url
    assert_selector "h1", text: "Fliers"
  end

  test "should create flier" do
    visit fliers_url
    click_on "New flier"

    fill_in "Group", with: @flier.group_id
    fill_in "Organization", with: @flier.organization_id
    fill_in "Project", with: @flier.project_id
    fill_in "Title", with: @flier.title
    fill_in "User", with: @flier.user_id
    click_on "Create Flier"

    assert_text "Flier was successfully created"
    click_on "Back"
  end

  test "should update Flier" do
    visit flier_url(@flier)
    click_on "Edit this flier", match: :first

    fill_in "Group", with: @flier.group_id
    fill_in "Organization", with: @flier.organization_id
    fill_in "Project", with: @flier.project_id
    fill_in "Title", with: @flier.title
    fill_in "User", with: @flier.user_id
    click_on "Update Flier"

    assert_text "Flier was successfully updated"
    click_on "Back"
  end

  test "should destroy Flier" do
    visit flier_url(@flier)
    click_on "Destroy this flier", match: :first

    assert_text "Flier was successfully destroyed"
  end
end
