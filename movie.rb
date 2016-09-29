require 'date'

class Movie
  attr_reader :link, :title, :year, :country, :date, :month, :genre, :duration, :rating, :director, :main_actors

  def initialize(link, title, year, country, date, genre, duration, rating, director, main_actors)
    @link = link
    @title = title
    @year = year.to_i
    @country = country
    @date = case date.split("-").size
              when date.split("-").size == 3
                Date.parse(date)
              when date.split("-").size == 2
                Date.strptime(date,'%Y-%m')
              when date.split("-").size == 1
                Date.strptime(date,'%Y')
            end
    puts @date
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

  def matches?(key,val)
    val === self.send(key)
  end

end
