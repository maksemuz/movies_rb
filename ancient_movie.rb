# AncientMovie class
module Kino
  class AncientMovie < Movie
    PRICE = 1

    def long_title
      "#{title} — старый фильм (#{year} год)"
    end
  end
end
