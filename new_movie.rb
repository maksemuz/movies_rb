require 'date'
require './movie.rb'
class NewMovie < Movie
  attr_reader :price, :output, :period, :link, :title, :year, :country, :date, :genre, :duration, :rating, :director, :main_actors, :collection
  def initialize(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
    super(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
    @price = 5
    @period = 'new'
    how_long = (Date.today.year - self.year).to_s.split("")
    if ( how_long.size == "1" or how_long.first == "1" ) and how_long.last == "1"
      word = "год"
    elsif ["2","3","4"].include?(how_long.last) and how_long[how_long.size-2] != "1"
      word = "года"
    else
      word = "лет"
    end
    @output = "#{self.title} — новинка, вышло #{Date.today.year - self.year} #{word} назад!"
  end

end