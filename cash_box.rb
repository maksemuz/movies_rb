module Kino
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

    # transfers money to bank, for both Netflix and Theatre
    def take(who)
      raise ArgumentError, "Your transaction looks criminal and is rejected. Calling the police." unless who == "Bank"
      @cash_box = 0.0
      "Transaction was accepted."
    end

  end

end
