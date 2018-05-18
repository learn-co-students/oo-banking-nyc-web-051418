require 'pry'


class Transfer
attr_accessor :amount, :sender, :receiver, :status

 def initialize(sender, receiver, amount)
   @amount = amount
   @sender = sender
   @receiver = receiver
   @status = "pending"

 end

 def valid?
   @sender.valid? && @receiver.valid?
   #.valid? is being called from BankAccount
 end
def bad_transfer
   @status = "rejected"
   "Transaction rejected. Please check your account balance."
end

def execute_transaction
   if @sender.valid? && @status == "pending" && @sender.balance > @amount
   @sender.balance -= @amount
   @receiver.balance += @amount
   @status = "complete"
 else
   bad_transfer
   #binding.pry
 end
end
def reverse_transfer
  # reverse transfer between 2 accounts
  # can reverse executed transfers
  if self.status == "complete"
    @sender.balance +=  @amount
    @receiver.balance -=  @amount
    @status = "reversed"
  end
 end

  # your code here
end
