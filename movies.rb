#!/usr/bin/env ruby
Encoding.default_external = 'UTF-8'
require 'csv'
require 'ostruct'
require 'date'

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
    arr.each { |movie| puts "#{movie.title} (#{movie.date}; #{movie.genre}) - #{movie.duration}"}
end

LABELS = %i[link title year country date genre duration rating director main_actors]
f2 = CSV.readlines(movie_file, col_sep: '|', headers: LABELS)
movies = f2.map { |row| OpenStruct.new(row.to_h)}

# Output of 5 longest movies
puts "\n5 longest movies\n\n"
var_to_out = movies
  .sort_by { |movie| movie.duration.to_i }
  .reverse
  .first(5)
film_out(var_to_out)

# Output of 10 comedies
puts "\n10 oldest comedies\n\n"
var_to_out = movies
  .find_all { |movie| movie.genre.include?("Comedy") }
  .sort_by { |movie| movie.date }
  .first(10)
film_out(var_to_out)

# Output of all directors
puts "\nAll directors sorted by last word of name\n\n"
movies.uniq( &:director )
  .sort_by { |movie| movie.director.split(" ").last }
  .each { |movie| puts "#{movie.director}"}

# Output of non-USA shot films amount
puts "\nAmount of non-USA shot films\n\n"
puts "#{movies.reject { |movie| movie.country.include?("USA") }.size}"


# Output of Films by month
puts "\nFilms are shot by month\n\n"

stats_array = movies.reject { |movie|  movie.date.split("-").size < 2; }
   .group_by { |movie| movie.date.split("-")[1] }
stats_array.sort
   .each { |month, movie| puts "#{Date::MONTHNAMES[month.to_i]} #{movie.size}" }

movies.each { |e| puts "#{e.inspect}" }
