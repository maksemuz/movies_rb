require 'csv'

class MovieCollection

  def initialize(file_name)
    @file_name = file_name
    @movies = CSV.readlines(@file_name,col_sep: '|')
      .map { |row| Movie.new(*row,self)}

  end

  def genres
    @genres ||=  @movies.each.map { |movie| movie.genre}.flatten.group_by(&:itself).keys
  end

  def all
    @movies
  end

  def sort_by(value)
    @movies.sort_by { |e| e.send(value) }
  end

  def filter(filters)
    filters.reduce(@movies) { |memo, (key,val)| memo.find_all { |row| row.matches?(key,val) } }
  end

  def stats(value)
      statsarr = @movies.map { |movie| movie.send(value) }
                     .flatten
                     .group_by(&:itself)
                     .map{|k,v| [k, v.count] }
      return statsarr

  end

end
