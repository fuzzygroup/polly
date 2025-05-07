require "test_helper"

class BankDepositsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bank_deposit = bank_deposits(:one)
  end

  test "should get index" do
    get bank_deposits_url
    assert_response :success
  end

  test "should get new" do
    get new_bank_deposit_url
    assert_response :success
  end

  test "should create bank_deposit" do
    assert_difference("BankDeposit.count") do
      post bank_deposits_url, params: { bank_deposit: { amount: @bank_deposit.amount, date_collected: @bank_deposit.date_collected, event_id: @bank_deposit.event_id, funds_type: @bank_deposit.funds_type, name: @bank_deposit.name, notes: @bank_deposit.notes, organization_id: @bank_deposit.organization_id, user_id: @bank_deposit.user_id } }
    end

    assert_redirected_to bank_deposit_url(BankDeposit.last)
  end

  test "should show bank_deposit" do
    get bank_deposit_url(@bank_deposit)
    assert_response :success
  end

  test "should get edit" do
    get edit_bank_deposit_url(@bank_deposit)
    assert_response :success
  end

  test "should update bank_deposit" do
    patch bank_deposit_url(@bank_deposit), params: { bank_deposit: { amount: @bank_deposit.amount, date_collected: @bank_deposit.date_collected, event_id: @bank_deposit.event_id, funds_type: @bank_deposit.funds_type, name: @bank_deposit.name, notes: @bank_deposit.notes, organization_id: @bank_deposit.organization_id, user_id: @bank_deposit.user_id } }
    assert_redirected_to bank_deposit_url(@bank_deposit)
  end

  test "should destroy bank_deposit" do
    assert_difference("BankDeposit.count", -1) do
      delete bank_deposit_url(@bank_deposit)
    end

    assert_redirected_to bank_deposits_url
  end
end
