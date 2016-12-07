module Kino
  class ModernMovie < Movie
    PRICE = 3

    def long_title
      "#{title} — современное кино: играют #{main_actors * ', '}"
    end
  end
end
