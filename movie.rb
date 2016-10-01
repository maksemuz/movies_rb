require 'date'

class Movie
  attr_reader :link, :title, :year, :country, :date, :genre, :duration, :rating, :director, :main_actors

  def initialize(link, title, year, country, date, genre, duration, rating, director, main_actors)
    @link = link
    @title = title
    @year = year.to_i
    @country = country
    @date = case date.split('-').size
      when 3
        Date.parse(date)
      when 2
        Date.strptime(date,'%Y-%m')
      when 1
        Date.strptime(date,'%Y')
    end
    @genre = genre.split(',')
    @duration = duration
    @rating = rating
    @director = director
    @main_actors = main_actors.split(',')
  end

  def month
    if @date.month
      Date::MONTHNAMES[@date.month.to_i]
    else
      nil
    end
  end

  def send_coll(value)
    @collection = value
  end

  def has_genre?(value)
    raise "Error. There's no such genre: \"#{value}\"." unless @collection.include?(value)
    genre.include?(value)
  end

  def has_actor?(value)
    @actor.include?(value)
  end

  def matches?(key,val)
    val === self.send(key)
  end

end
