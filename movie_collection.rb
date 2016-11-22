module Kino
  require 'csv'

  class MovieCollection

    include Enumerable

    def initialize(file_name)
      @file_name = file_name
      @movies = CSV.readlines(@file_name,col_sep: '|')
                    .map { |row| Movie.create(*row,self)}
    end

    def genres
      @genres ||=  @movies.each.map { |movie| movie.genre}.flatten.uniq
    end

    def all
      @movies
    end

    def sort_by(value)
      @movies.sort_by { |e| e.send(value) }
    end

    def filter(filters)
      filters.reduce(@movies) { |memo, (key,val)|
        memo.find_all { |row| row.matches?(key,val)} }
    end

    def stats(value)
      @movies.map { |movie| movie.send(value) }
          .flatten
          .group_by(&:itself)
          .map{|k,v| [k, v.count] }
    end


    def get_rnd_film(films)
      # this method returns the single random movie object
      # here is triangle distribution of random values, it's taken from this link:
      # https://habrahabr.ru/post/151187/
      rate_min = films.min_by(&:rating).rating
      rate_max = films.max_by(&:rating).rating
      rnum = Random.new
      u = rnum.rand(rate_max) / rate_max
      if u <= 1
        rate = (rate_min + Math.sqrt(u * ((rate_max - rate_min)**2))).round(1)
      else
        rate = rate_max.round(1)
      end
      films.find_all { |movie| movie.rating.to_f >= rate}.sample
    end

  end
end
