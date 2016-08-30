#!/usr/bin/env ruby
Encoding.default_external = 'UTF-8'
require 'csv'
require 'ostruct'

if ARGV.length == 0
  puts "\n\nYou did not enter filename. Using movies.txt\n\n"
  movie_file = "movies.txt"
else
    movie_file = ARGV[0]
end
if !File.exist?(movie_file)
  puts "\n\nFile #{ARGV[0]} does not exist. Nothing to process. Exit.\n\n"
  exit
end


def film_out(arr)
    arr.each { |obj| puts "#{obj.title} \(#{obj.date}; #{obj.genre}\) - #{obj.duration}"}
end

labels = [:link, :title, :year, :country, :date, :genre, :duration, :rating, :director, :main_actors]

f2 = CSV.readlines(movie_file, col_sep: '|')
movies_array2 = f2.map { |one_ar|  OpenStruct.new(labels.zip(one_ar).to_h)}

# Output of 5 longest movies
puts "\n5 longest movies\n\n"
var_to_out = movies_array2
  .sort_by { |obj| obj.duration.to_i }
  .reverse
  .first(5)
film_out(var_to_out)

# Output of 10 comedies
puts "\n10 oldest comedies\n\n"
var_to_out = movies_array2
  .find_all { |obj| obj.genre.include?("Comedy") }
  .sort_by { |obj| obj.date }
  .first(10)
film_out(var_to_out)

# Output of all directors
puts "\nAll diretors sorted by last word of name\n\n"
movies_array2.uniq { |obj| obj.director  }
  .sort_by { |obj| obj.director.split(" ").last }
  .each { |obj| puts "#{obj.director}"}

# Output of non-USA shot films amount
puts "\nAmount of non-USA shot films\n\n"
puts "#{movies_array2.reject { |obj| obj.country.include?("USA") }.size}"
