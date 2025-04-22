require "application_system_test_case"

class VettingQuestionsTest < ApplicationSystemTestCase
  setup do
    @vetting_question = vetting_questions(:one)
  end

  test "visiting the index" do
    visit vetting_questions_url
    assert_selector "h1", text: "Vetting questions"
  end

  test "should create vetting question" do
    visit vetting_questions_url
    click_on "New vetting question"

    check "Active" if @vetting_question.active
    fill_in "Body", with: @vetting_question.body
    fill_in "Group", with: @vetting_question.group_id
    fill_in "Organization", with: @vetting_question.organization_id
    fill_in "User", with: @vetting_question.user_id
    click_on "Create Vetting question"

    assert_text "Vetting question was successfully created"
    click_on "Back"
  end

  test "should update Vetting question" do
    visit vetting_question_url(@vetting_question)
    click_on "Edit this vetting question", match: :first

    check "Active" if @vetting_question.active
    fill_in "Body", with: @vetting_question.body
    fill_in "Group", with: @vetting_question.group_id
    fill_in "Organization", with: @vetting_question.organization_id
    fill_in "User", with: @vetting_question.user_id
    click_on "Update Vetting question"

    assert_text "Vetting question was successfully updated"
    click_on "Back"
  end

  test "should destroy Vetting question" do
    visit vetting_question_url(@vetting_question)
    click_on "Destroy this vetting question", match: :first

    assert_text "Vetting question was successfully destroyed"
  end
end
