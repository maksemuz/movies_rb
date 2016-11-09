require './movie.rb'
class ClassicMovie < Movie
  PRICE = 1.5

  def long_title
    films = @collection.filter(director: self.director)
    "#{self.title} — классический фильм, режиссёр #{self.director} (еще #{films.size} фильмов в топе)"
  end

end