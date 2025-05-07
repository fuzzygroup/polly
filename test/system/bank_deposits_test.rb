require "application_system_test_case"

class BankDepositsTest < ApplicationSystemTestCase
  setup do
    @bank_deposit = bank_deposits(:one)
  end

  test "visiting the index" do
    visit bank_deposits_url
    assert_selector "h1", text: "Bank deposits"
  end

  test "should create bank deposit" do
    visit bank_deposits_url
    click_on "New bank deposit"

    fill_in "Amount", with: @bank_deposit.amount
    fill_in "Date collected", with: @bank_deposit.date_collected
    fill_in "Event", with: @bank_deposit.event_id
    fill_in "Funds type", with: @bank_deposit.funds_type
    fill_in "Name", with: @bank_deposit.name
    fill_in "Notes", with: @bank_deposit.notes
    fill_in "Organization", with: @bank_deposit.organization_id
    fill_in "User", with: @bank_deposit.user_id
    click_on "Create Bank deposit"

    assert_text "Bank deposit was successfully created"
    click_on "Back"
  end

  test "should update Bank deposit" do
    visit bank_deposit_url(@bank_deposit)
    click_on "Edit this bank deposit", match: :first

    fill_in "Amount", with: @bank_deposit.amount
    fill_in "Date collected", with: @bank_deposit.date_collected
    fill_in "Event", with: @bank_deposit.event_id
    fill_in "Funds type", with: @bank_deposit.funds_type
    fill_in "Name", with: @bank_deposit.name
    fill_in "Notes", with: @bank_deposit.notes
    fill_in "Organization", with: @bank_deposit.organization_id
    fill_in "User", with: @bank_deposit.user_id
    click_on "Update Bank deposit"

    assert_text "Bank deposit was successfully updated"
    click_on "Back"
  end

  test "should destroy Bank deposit" do
    visit bank_deposit_url(@bank_deposit)
    click_on "Destroy this bank deposit", match: :first

    assert_text "Bank deposit was successfully destroyed"
  end
end
