require 'date'

class Movie
  attr_reader :link, :title, :year, :country, :date, :month, :genre, :duration, :rating, :director, :main_actors

  def initialize(link, title, year, country, date, genre, duration, rating, director, main_actors)
    @link = link
    @title = title
    @year = year
    @country = country
    @date = date.split("-")
    @genre = genre.split(",")
    @duration = duration
    @rating = rating
    @director = director
    @main_actors = main_actors.split(",")
    if @date[1] != nil
      @month = Date::MONTHNAMES[@date[1].to_i]
    else
      @month = "No month in date. Out of statistics"
    end
  end

  def has_genre?(value)
    @genre.include?(value)
  end

  def has_actor?(value)
    @actor.include?(value)
  end

end
