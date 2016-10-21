require 'date'

class Movie
  attr_reader :link, :title, :year, :country, :date, :genre, :duration, :rating, :director, :main_actors, :collection, :period

  def initialize(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)
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
    @duration = duration.to_i
    @rating = rating
    @director = director
    @main_actors = main_actors.split(',')
    @collection = collection
    if @year <= 1945
      @period = "ancient"
    elsif @year > 1945 && @year <= 1968
      @period = "classic"
    elsif @year > 1968 && @year <= 2000
      @period = "modern"
    else
      @period = "new"
    end
  end

  def month
    if @date.month
      Date::MONTHNAMES[@date.month.to_i]
    else
      nil
    end
  end

  def has_genre?(value)
    raise "Error. There's no such genre: \"#{value}\"." unless @collection.genres.include?(value)
    genre.include?(value)
  end

  def has_actor?(value)
    @actor.include?(value)
  end

  def matches?(key,val)
    if self.send(key).is_a?(Array)
      self.send(key).include?(val)
    else
      val === self.send(key)
    end
  end

end
