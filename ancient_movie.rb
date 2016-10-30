require './movie.rb'
class AncientMovie < Movie
  attr_reader :price, :output, :period, :link, :title, :year, :country, :date, :genre, :duration, :rating, :director, :main_actors, :collection
  def initialize(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
    super(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
    @price = 1
    @period = 'ancient'
    @output = "#{self.title} — старый фильм (#{self.year} год)"
  end

end
