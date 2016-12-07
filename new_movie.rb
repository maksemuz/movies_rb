module Kino
  class NewMovie < Movie
    PRICE = 5

    def get_word(years)
      return 'лет' if (11..19).cover?(years)
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
      how_long = (Date.today.year - year)
      "#{title} — новинка, вышло #{how_long} #{get_word(how_long)} назад!"
    end
  end
end
