require './movie.rb'
class ClassicMovie < Movie
  attr_reader :price, :output, :period, :link, :title, :year, :country, :date, :genre, :duration, :rating, :director, :main_actors, :collection
  def initialize(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
    super(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
    @price = 1.5
    @period = 'classic'
    @output = "#{self.title} — классический фильм, режиссёр #{self.director} (ещё 10 его фильмов в спике)"
  end

end