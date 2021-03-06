# frozen_string_literal: true
# Cash box module
module Kino
  require 'date'
  require 'money'
  I18n.enforce_available_locales = false
  # start of module Cash box itself
  module Cashbox
    # returns amount of money, for both Netflix and Theatre
    def cash
      @cash_box
    end

    def pay(amount)
      @cash_box ||= Money.new(0, 'USD')
      raise ArgumentError, "!!! Kino::pay - cash_box"\
      " #{@cash_box.class}" unless @cash_box
      @cash_box += amount
      @cash_box.format
    end

    # transfers money to bank, for both Netflix and Theatre
    def take(who)
      raise ArgumentError, 'Your transaction looks criminal and is rejected.'\
      ' Calling the police.' unless who == 'Bank'
      @cash_box = Money.new(0, 'USD')
      'Transaction was accepted.'
    end
  end
end
