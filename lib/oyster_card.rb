class OysterCard
  attr_reader :balance

  BALANCE_LIMIT = 90
  MINIMUM_AMOUNT = 1

  def initialize(balance = 0)
    @balance = balance
    @in_journey = false
  end

  def top_up(value)
    fail "Cannot exceed £#{BALANCE_LIMIT} limit." if @balance + value > BALANCE_LIMIT
    @balance += value
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    fail "Need to have at least £#{MINIMUM_AMOUNT}." if @balance < MINIMUM_AMOUNT
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_AMOUNT)
    @in_journey = false
  end

  private

  def deduct(value)
    @balance -= value
  end

end