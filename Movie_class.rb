class Movie
  attr_reader :link, :title, :year, :country, :date, :genre, :duration, :rating, :director, :main_actors
  def initialize(link, title, year, country, date, genre, duration, rating, director, main_actors)
    @link = link
    @title = title
    @year = year
    @country = country
    @date = date
    @genre = genre
    @duration = duration
    @rating = rating
    @director = director
    @main_actors = main_actors
  end

end
