class MovieCollection
require 'csv'
require 'date'
  def initialize(file_name)
    @file_name = file_name
    @movies = CSV.readlines(@file_name,col_sep: '|')
      .map { |row| Movie.new(*row)}
  end
  def all
    @movies
  end
  def filter(value)
    @movies.find_all { |row| row.send(*value.keys).include?(*value.values) }
  end
  def stats(value)
    @movies.each { |row| row.send(value) }.group_by { |e| e.send(value) }
  end

end
