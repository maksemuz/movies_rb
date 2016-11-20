module Kino
  require 'date'
  require './movie.rb'
  require 'money'
  I18n.enforce_available_locales = false

  class NewMovie < Movie
    PRICE = 5

    def get_word(years)
      return 'лет' if (11..19).include?(years)
      case years % 10
        when 1
          "год"
        when 2..4
          "года"
        else
          "лет"
      end
    end

    def long_title
      how_long = (Date.today.year - self.year)
      "#{self.title} — новинка, вышло #{how_long} #{get_word(how_long)} назад!"
    end

  end
end
