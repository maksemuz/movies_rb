require './movie.rb'
class ClassicMovie < Movie
  attr_reader :price, :output, :period, :link, :title, :year, :country, :date, :genre, :duration, :rating, :director, :main_actors, :collection
  def initialize(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
    super(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
    @price = 1.5
    @period = 'classic'
    @collection = collection
  end

  def output
    @films = @collection.filter(director: self.director).take(10).map { |movie| movie.title} * ", "
    @output = "#{self.title} — классический фильм, режиссёр #{self.director} (#{@films})"
  end

end