require 'test_helper'

class GameBanksControllerTest < ActionController::TestCase
  setup do
    @game_bank = game_banks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:game_banks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game_bank" do
    assert_difference('GameBank.count') do
      post :create, game_bank: { amount: @game_bank.amount, description: @game_bank.description, party: @game_bank.party, trans_type: @game_bank.trans_type }
    end

    assert_redirected_to game_bank_path(assigns(:game_bank))
  end

  test "should show game_bank" do
    get :show, id: @game_bank
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game_bank
    assert_response :success
  end

  test "should update game_bank" do
    patch :update, id: @game_bank, game_bank: { amount: @game_bank.amount, description: @game_bank.description, party: @game_bank.party, trans_type: @game_bank.trans_type }
    assert_redirected_to game_bank_path(assigns(:game_bank))
  end

  test "should destroy game_bank" do
    assert_difference('GameBank.count', -1) do
      delete :destroy, id: @game_bank
    end

    assert_redirected_to game_banks_path
  end
end
