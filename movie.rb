require 'date'
require './ancient_movie.rb'
require './classic_movie.rb'
require './modern_movie.rb'
require './new_movie.rb'

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

  def self.create(link, title, year, country, date, genre, duration, rating, director, main_actors, collection)

    if year.to_i <= 1945
      AncientMovie.new
    elsif year.to_i > 1945 && year.to_i <= 1968
      ClassicMovie.new
    elsif year.to_i > 1968 && year.to_i <= 2000
      ModernMovie.new
    else
      NewMovie.new
    end
  end

end
