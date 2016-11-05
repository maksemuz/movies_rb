require './movie.rb'
class ClassicMovie < Movie
  PRICE = 1.5
  def initialize(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
    super(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
    @collection = collection
  end

  def long_title
    @films = @collection.filter(director: self.director).take(10).map { |movie| movie.title}
    "#{self.title} — классический фильм, режиссёр #{self.director} (еще #{@films.size} фильмов в топе)"
  end

end