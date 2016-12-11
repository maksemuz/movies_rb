# frozen_string_literal: true
module Kino
  require 'date'

  class Movie
    attr_reader :link, :title, :year, :country,
                :date, :genre, :duration, :rating,
                :director, :main_actors, :collection

    def initialize(link, title, year, country,
                   date, genre, duration, rating,
                   director, main_actors, collection)
      @link = link
      @title = title
      @year = year.to_i
      @country = country
      @date = case date.split('-').size
              when 3
                Date.parse(date)
              when 2
                Date.strptime(date, '%Y-%m')
              when 1
                Date.strptime(date, '%Y')
              end
      @genre = genre.split(',')
      @duration = duration.to_i
      @rating = rating.to_f
      @director = director
      @main_actors = main_actors.split(',')
      @collection = collection
    end

    def month
      Date::MONTHNAMES[@date.month.to_i] if @date.month
    end

    def has_genre?(value)
      raise ArgumentError,"Error. There's no such genre: \"#{value}\"."\
        unless @collection.genres.include?(value)
      genre.include?(value)
    end

    def has_actor?(value)
      @actor.include?(value)
    end

    def matches?(key, val)
      if send(key).is_a?(Array)
        send(key).include?(val)
      else
        val === send(key)
      end
    end

    def self.create(link, title, year, country,
        date, genre, duration, rating,
        director, main_actors, collection)
      case year.to_i
      when (1900...1945)
        AncientMovie.new(link, title, year, country,
                         date, genre, duration, rating,
                         director, main_actors, collection)
      when (1945...1968)
        ClassicMovie.new(link, title, year, country,
                         date, genre, duration, rating,
                         director, main_actors, collection)
      when (1968...2000)
        ModernMovie.new(link, title, year, country,
                        date, genre, duration, rating,
                        director, main_actors, collection)
      else
        NewMovie.new(link, title, year, country,
                     date, genre, duration, rating,
                     director, main_actors, collection)
      end
    end

    def period
      # self.class.name.sub(/Movie/,'').downcase
      self.class.name.sub(/Movie/, '').sub(/Kino::/, '').downcase
    end

    def price
      Money.from_amount(self.class::PRICE, 'USD')
    end
  end

  require './ancient_movie.rb'
  require './classic_movie.rb'
  require './modern_movie.rb'
  require './new_movie.rb'
end
