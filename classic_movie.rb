module Kino
  class ClassicMovie < Movie
    PRICE = 1.5

    def long_title
      films = @collection.filter(director: director)
      "#{title} — классический фильм, режиссёр #{director} (еще #{films.size} фильмов в топе)"
    end
  end
end
