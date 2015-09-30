class GameBank < ActiveRecord::Base
  def balance
    balance = 0
    # IF trans_type == "D"
    # subtract game_bank.amount from balance
    # ELSIF trans_type == "C"
    #
  end

  def check
    # IF trans_type != "D" || trans_type != "C"
    # return false
  end
end
