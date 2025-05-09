require "application_system_test_case"

class MusiciansTest < ApplicationSystemTestCase
  setup do
    @musician = musicians(:one)
  end

  test "visiting the index" do
    visit musicians_url
    assert_selector "h1", text: "Musicians"
  end

  test "should create musician" do
    visit musicians_url
    click_on "New musician"

    fill_in "Band name", with: @musician.band_name
    fill_in "Bio", with: @musician.bio
    fill_in "Contact card", with: @musician.contact_card_id
    fill_in "Name", with: @musician.name
    fill_in "Notes", with: @musician.notes
    fill_in "Play count", with: @musician.play_count
    fill_in "Pronouns", with: @musician.pronouns
    fill_in "Url", with: @musician.url
    fill_in "User", with: @musician.user_id
    click_on "Create Musician"

    assert_text "Musician was successfully created"
    click_on "Back"
  end

  test "should update Musician" do
    visit musician_url(@musician)
    click_on "Edit this musician", match: :first

    fill_in "Band name", with: @musician.band_name
    fill_in "Bio", with: @musician.bio
    fill_in "Contact card", with: @musician.contact_card_id
    fill_in "Name", with: @musician.name
    fill_in "Notes", with: @musician.notes
    fill_in "Play count", with: @musician.play_count
    fill_in "Pronouns", with: @musician.pronouns
    fill_in "Url", with: @musician.url
    fill_in "User", with: @musician.user_id
    click_on "Update Musician"

    assert_text "Musician was successfully updated"
    click_on "Back"
  end

  test "should destroy Musician" do
    visit musician_url(@musician)
    click_on "Destroy this musician", match: :first

    assert_text "Musician was successfully destroyed"
  end
end
