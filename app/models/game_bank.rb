require 'byebug'

class GameBank < ActiveRecord::Base
  def self.nummies
    self.count
  end

  def self.debits_list
    self.all.select { |x| x.trans_type == "D" }
  end

  def self.credits_list
    self.all.select { |x| x.trans_type == "C" }
  end

  def self.dtots
    debits_list.reduce(0) { |s, c| s + c.amount }
  end

  def self.ctots
    credits_list.reduce(0) { |s, c| s + c.amount }
  end

  def self.balance
    self.ctots - self.dtots
  end

  def self.gameover?
    balance < 0
  end

  def self.max_expense
    self.debits_list.sort.first.amount
  end

  def self.big_spender
    # Find sum of amount by party
  end
end
