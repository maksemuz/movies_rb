require 'date'
require './movie.rb'
class NewMovie < Movie
  attr_reader :price, :output, :period, :link, :title, :year, :country, :date, :genre, :duration, :rating, :director, :main_actors, :collection
  def initialize(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
    super(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
    @price = 5
    @period = 'new'
    @output = "#{self.title} — новинка, вышло #{Date.today.year - self.year} лет назад!"
  end

end