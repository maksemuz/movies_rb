require './movie.rb'
class AncientMovie < Movie
  PRICE = 1
  def initialize(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
    super(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
  end

  def long_title
    "#{self.title} — старый фильм (#{self.year} год)"
  end

end
