require 'byebug'

class GameBank < ActiveRecord::Base

  def self.debits_this_month
    self.where("created_at BETWEEN ? AND ?",
      Time.now.beginning_of_month, Time.now.end_of_month).count
  end

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
    # Find sum of amount by party.

    #RUBY STYLE
    # debits = self.all.select {|e| e.trans_type == "D"}
    #
    # parties = Hash.new(0)
    # debits.each do |d|
    #   # parties[d.party] ||= 0  # If nil replace with 0, otherwise leave alone.  Memoization is what this is called.
    #   parties[d.party] += d.amount
    # end
    #
    # l_party = nil
    # l_amount = 0
    # parties.each do |k, v|
    #   if v < l_amount
    #     l_amount = v
    #     l_party = k
    #   end
    # end
    # l_party

    #SQL STYLE
    self.where(trans_type: "D").group(:party).order("sum(amount)").last.party
    # Where trans_type is D, group by party and order by the sum of amounts and then return the top party.
    # Where is a symbol call to the field to check for D
    # Group is just a symbol call to field
    # Order is a string being passed into the SQL order command
    # Last is grabbing the last object in the list
    # Party is returning the party name from that object
  end

  def self.spent_this_month
    # Find amount spent this month.
  end
end
