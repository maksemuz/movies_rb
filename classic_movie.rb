module Kino
  require './movie.rb'
  require 'money'
  I18n.enforce_available_locales = false


  class ClassicMovie < Movie
    PRICE = 1.5

    def long_title
      films = @collection.filter(director: self.director)
      "#{self.title} — классический фильм, режиссёр #{self.director} (еще #{films.size} фильмов в топе)"
    end

  end
end
