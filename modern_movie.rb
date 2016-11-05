require './movie.rb'
class ModernMovie < Movie
  PRICE = 3
  def initialize(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
    super(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
   end

  def long_title
    "#{self.title} — современное кино: играют #{self.main_actors * ", "}"
  end

end