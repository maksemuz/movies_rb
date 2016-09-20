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
    #filters.reduce(@movies)
    result = @movies
    filters.reduce(1) { |res, pair| result=result.find_all { |row| row.send(pair[0]).include?(pair[1].to_s) } }
    return result
  end

  def stats(value)
    if value == :actors
      actors = @movies.map { |e| e.main_actors.split(",") }.flatten
      stat_actors = Hash[ actors.group_by { |a| a }.map { |name, num| [name,num.count] } ]
      return stat_actors
    else
      @movies.find_all { |row| row.send(value) }.group_by { |e| e.send(value) }
    end
  end

end
