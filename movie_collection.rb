require 'csv'

class MovieCollection

  def initialize(file_name)
    @file_name = file_name
    @movies = CSV.readlines(@file_name,col_sep: '|')
      .map { |row| Movie.new(*row)}
  end

  def all
    @movies
  end

  def sort_by(value)
    @movies.sort_by { |e| e.send(value) }
  end

  def filter(filters)
    filters.reduce(@movies) { |memo, (key,val)| memo.find_all { |row| row.send(key).include?(val.to_s) } }
  end

  def stats(value)
    if value == :genre or value == :main_actors
      statsarr = @movies.find_all { |movie| movie.send(value) }
                     .group_by { |e| e.send(value) }
                     .keys.flatten
                     .group_by{|i| i}
                     .map{|k,v| [k, v.count] }

      return statsarr
    else
      statsarr = @movies.find_all { |movie| movie.send(value) }
                     .group_by { |e| e.send(value) }
                     .map{|k,v| [k, v.count] }
      return statsarr
    end


  end

end
