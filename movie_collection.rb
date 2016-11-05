require 'csv'

class MovieCollection

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
      memo.find_all { |row| row.matches?(key,val) } }
  end

  def stats(value)
      @movies.map { |movie| movie.send(value) }
                     .flatten
                     .group_by(&:itself)
                     .map{|k,v| [k, v.count] }
  end

end