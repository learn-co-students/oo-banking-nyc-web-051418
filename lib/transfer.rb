require 'pry'
require 'bank_account'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? == @receiver.valid?
  end

  def execute_transaction
    if @status == 'pending'
      @sender.balance -= @amount
      @receiver.balance += @amount
      if @sender.valid?
        @status = 'complete'
      else
        @status = 'rejected'
        'Transaction rejected. Please check your account balance.'
      end
    else
      false
    end
  end

  def reverse_transfer
    if @status != 'pending'
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    else
      false
    end
  end
end
