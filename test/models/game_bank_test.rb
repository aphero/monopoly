require 'test_helper'

class GameBankTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "the nummies" do
    a = GameBank.create()
    b = GameBank.create()
    assert_equal GameBank.nummies, 4
  end

  test "debits list" do
    a = GameBank.create(trans_type: 'D')
    assert_equal GameBank.debits_list.length, 2
  end

  test "credits list" do
    a = GameBank.create(trans_type: 'C')
    assert_equal GameBank.credits_list.length, 2
  end
end
