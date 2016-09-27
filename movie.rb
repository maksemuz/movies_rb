require 'date'

class Movie
  attr_reader :link, :title, :year, :country, :date, :month, :genre, :duration, :rating, :director, :main_actors

  def initialize(link, title, year, country, date, genre, duration, rating, director, main_actors)
    @link = link
    @title = title
    @year = year
    @country = country
    if date.split("-").size == 3
      @date = Date.parse(date)
    elsif date.split("-").size == 2
      #throw date
      @date = Date.strptime(date,'%Y-%m')
    else
      @date = Date.strptime(date,'%Y')
    end
    @genre = genre.split(",")
    @duration = duration
    @rating = rating
    @director = director
    @main_actors = main_actors.split(",")
    if @date.month
      @month = Date::MONTHNAMES[@date.month.to_i]
    else
      @month = nil
    end
  end

  def has_genre?(value)
    @genre.include?(value)
  end

  def has_actor?(value)
    @actor.include?(value)
  end

end
