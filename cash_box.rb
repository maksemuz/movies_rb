require 'date'
require 'money'
I18n.enforce_available_locales = false

module Cashbox

  # returns amount of money, for both Netflix and Theatre
  def cash
    @cash_box.format
  end

  def pay(amount)
    @cash_box ||= Money.new(0, "USD")
    @cash_box += amount
    @cash_box.format
  end

  #for theatre, it places money to moneybox, for Theatre only
  def buy_ticket(movie_name)
    time = self.when?(movie_name)
    price = self.price[time]
    @cash_box += price
    puts "You have bought a ticket to \"#{movie_name}\"."
    Money.new(price,"USD").format

  end

  # transfers money to bank, for both Netflix and Theatre
  def take(who)
    raise ArgumentError, "Your transaction looks criminal and is rejected. Calling the police." unless who == "Bank"
    @cash_box = 0.0
    "Transaction was accepted."
  end

end
