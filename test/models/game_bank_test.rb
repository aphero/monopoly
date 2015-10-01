require 'test_helper'

class GameBankTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "the nummies" do
    assert_equal GameBank.nummies, 5
  end

  test "debits list" do
    a = GameBank.create(trans_type: 'D')
    assert_equal GameBank.debits_list.length, 2
  end

  test "credits list" do
    a = GameBank.create(trans_type: 'C')
    assert_equal GameBank.credits_list.length, 2
  end

  test "debit tots" do
    a = GameBank.create(trans_type: 'D', amount: 23)
    assert_equal GameBank.dtots, 373
  end

  test "credit tots" do
    a = GameBank.create(trans_type: 'C', amount: 70)
    assert_equal GameBank.ctots, 270
  end

  test "balance" do
    a = GameBank.create(trans_type: 'D', amount: 70)
    assert_equal GameBank.balance, -220
  end

  test "GAME OVER" do
    assert_equal GameBank.gameover?, true
  end

  test "max expense" do
    a = GameBank.create(trans_type: 'D', amount: 70)
    b = GameBank.create(trans_type: 'D', amount: 23)
    assert_equal GameBank.max_expense, 350
    refute_equal GameBank.max_expense, 70
  end

  test "current month transaction count" do
    assert_equal 4, GameBank.debits_this_month
    GameBank.create!(party: "Bank", trans_type: "C", amount: 200)
    assert_equal 5, GameBank.debits_this_month
  end
end
