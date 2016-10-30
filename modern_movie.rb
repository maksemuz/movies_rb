require './movie.rb'
class ModernMovie < Movie
  attr_reader :price, :output, :period, :link, :title, :year, :country, :date, :genre, :duration, :rating, :director, :main_actors, :collection
  def initialize(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
    super(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
    @price = 3
    @period = 'modern'
    @output = "#{self.title} — современное кино: играют #{self.main_actors}"
  end

end