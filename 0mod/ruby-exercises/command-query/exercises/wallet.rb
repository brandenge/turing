class Wallet
  COINS_IN_CENTS = { penny: 1, nickel: 5, dime: 10, quarter: 25 }.freeze

  def initialize
    @coin_counts = { penny: 0, nickel: 0, dime: 0, quarter: 0 }
    @cents = 0
  end

  def cents
    @cents = @coin_counts[:penny] * COINS_IN_CENTS[:penny] + @coin_counts[:nickel] * COINS_IN_CENTS[:nickel] +
              @coin_counts[:dime] * COINS_IN_CENTS[:dime] + @coin_counts[:quarter] * COINS_IN_CENTS[:quarter]
  end

  def <<(coin)
    @coin_counts[coin] += 1
  end

  def take(*coins)
    coins.each{ |coin| @coin_counts[coin] <= 0 ? 0 : @coin_counts[coin] -= 1 }
  end
end
