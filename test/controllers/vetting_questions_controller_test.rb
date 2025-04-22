require "test_helper"

class VettingQuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vetting_question = vetting_questions(:one)
  end

  test "should get index" do
    get vetting_questions_url
    assert_response :success
  end

  test "should get new" do
    get new_vetting_question_url
    assert_response :success
  end

  test "should create vetting_question" do
    assert_difference("VettingQuestion.count") do
      post vetting_questions_url, params: { vetting_question: { active: @vetting_question.active, body: @vetting_question.body, group_id: @vetting_question.group_id, organization_id: @vetting_question.organization_id, user_id: @vetting_question.user_id } }
    end

    assert_redirected_to vetting_question_url(VettingQuestion.last)
  end

  test "should show vetting_question" do
    get vetting_question_url(@vetting_question)
    assert_response :success
  end

  test "should get edit" do
    get edit_vetting_question_url(@vetting_question)
    assert_response :success
  end

  test "should update vetting_question" do
    patch vetting_question_url(@vetting_question), params: { vetting_question: { active: @vetting_question.active, body: @vetting_question.body, group_id: @vetting_question.group_id, organization_id: @vetting_question.organization_id, user_id: @vetting_question.user_id } }
    assert_redirected_to vetting_question_url(@vetting_question)
  end

  test "should destroy vetting_question" do
    assert_difference("VettingQuestion.count", -1) do
      delete vetting_question_url(@vetting_question)
    end

    assert_redirected_to vetting_questions_url
  end
end
