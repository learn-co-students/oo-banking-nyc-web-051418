class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    return sender.valid? && receiver.valid?
  end

  def execute_transaction
    @status = "rejected"
    if valid? && sender.balance > @amount
      sender.balance -= @amount
      receiver.balance += @amount
      receiver.status = "closed"
      sender.status = "closed"
      @status = "complete"
    else
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      receiver.status = "open"
      sender.status = "open"
      receiver.balance -= @amount
      sender.balance += @amount
      receiver.status = "closed"
      sender.status = "closed"
      @status = "reversed"
    end
  end
end
