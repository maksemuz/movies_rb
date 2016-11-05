require 'date'
require './movie.rb'
class NewMovie < Movie
  PRICE = 5
  def initialize(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
    super(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
  end

  def get_word(number)
    if number % 10 == 1 && !(10..20).include?(number)
      "год"
    elsif (2..4).include?(number % 10) && !(12..14).include?(number)
      "года"
    else
        "лет"
    end
  end

  def long_title
    how_long = (Date.today.year - self.year)
    "#{self.title} — новинка, вышло #{how_long} #{get_word(how_long)} назад!"
  end

end