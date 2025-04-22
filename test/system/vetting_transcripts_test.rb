require "application_system_test_case"

class VettingTranscriptsTest < ApplicationSystemTestCase
  setup do
    @vetting_transcript = vetting_transcripts(:one)
  end

  test "visiting the index" do
    visit vetting_transcripts_url
    assert_selector "h1", text: "Vetting transcripts"
  end

  test "should create vetting transcript" do
    visit vetting_transcripts_url
    click_on "New vetting transcript"

    check "Active" if @vetting_transcript.active
    fill_in "Body", with: @vetting_transcript.body
    fill_in "Chat type", with: @vetting_transcript.chat_type
    fill_in "Chat user", with: @vetting_transcript.chat_user
    fill_in "Extracted objects", with: @vetting_transcript.extracted_objects
    fill_in "Group", with: @vetting_transcript.group_id
    fill_in "Name", with: @vetting_transcript.name
    fill_in "Organization", with: @vetting_transcript.organization_id
    fill_in "User", with: @vetting_transcript.user_id
    click_on "Create Vetting transcript"

    assert_text "Vetting transcript was successfully created"
    click_on "Back"
  end

  test "should update Vetting transcript" do
    visit vetting_transcript_url(@vetting_transcript)
    click_on "Edit this vetting transcript", match: :first

    check "Active" if @vetting_transcript.active
    fill_in "Body", with: @vetting_transcript.body
    fill_in "Chat type", with: @vetting_transcript.chat_type
    fill_in "Chat user", with: @vetting_transcript.chat_user
    fill_in "Extracted objects", with: @vetting_transcript.extracted_objects
    fill_in "Group", with: @vetting_transcript.group_id
    fill_in "Name", with: @vetting_transcript.name
    fill_in "Organization", with: @vetting_transcript.organization_id
    fill_in "User", with: @vetting_transcript.user_id
    click_on "Update Vetting transcript"

    assert_text "Vetting transcript was successfully updated"
    click_on "Back"
  end

  test "should destroy Vetting transcript" do
    visit vetting_transcript_url(@vetting_transcript)
    click_on "Destroy this vetting transcript", match: :first

    assert_text "Vetting transcript was successfully destroyed"
  end
end
