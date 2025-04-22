require "test_helper"

class VettingTranscriptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vetting_transcript = vetting_transcripts(:one)
  end

  test "should get index" do
    get vetting_transcripts_url
    assert_response :success
  end

  test "should get new" do
    get new_vetting_transcript_url
    assert_response :success
  end

  test "should create vetting_transcript" do
    assert_difference("VettingTranscript.count") do
      post vetting_transcripts_url, params: { vetting_transcript: { active: @vetting_transcript.active, body: @vetting_transcript.body, chat_type: @vetting_transcript.chat_type, chat_user: @vetting_transcript.chat_user, extracted_objects: @vetting_transcript.extracted_objects, group_id: @vetting_transcript.group_id, name: @vetting_transcript.name, organization_id: @vetting_transcript.organization_id, user_id: @vetting_transcript.user_id } }
    end

    assert_redirected_to vetting_transcript_url(VettingTranscript.last)
  end

  test "should show vetting_transcript" do
    get vetting_transcript_url(@vetting_transcript)
    assert_response :success
  end

  test "should get edit" do
    get edit_vetting_transcript_url(@vetting_transcript)
    assert_response :success
  end

  test "should update vetting_transcript" do
    patch vetting_transcript_url(@vetting_transcript), params: { vetting_transcript: { active: @vetting_transcript.active, body: @vetting_transcript.body, chat_type: @vetting_transcript.chat_type, chat_user: @vetting_transcript.chat_user, extracted_objects: @vetting_transcript.extracted_objects, group_id: @vetting_transcript.group_id, name: @vetting_transcript.name, organization_id: @vetting_transcript.organization_id, user_id: @vetting_transcript.user_id } }
    assert_redirected_to vetting_transcript_url(@vetting_transcript)
  end

  test "should destroy vetting_transcript" do
    assert_difference("VettingTranscript.count", -1) do
      delete vetting_transcript_url(@vetting_transcript)
    end

    assert_redirected_to vetting_transcripts_url
  end
end
