#!/usr/bin/env ruby

Encoding.default_external = 'UTF-8'

require './movie.rb'
require './movie_collection.rb'
require 'ostruct'
require 'date'


if ARGV.length == 0
  puts "\n\nYou did not enter filename. Using movies.txt\n\n"
  movie_file = "./movies.txt"
else
    movie_file = ARGV[0]
end
if !File.exist?(movie_file)
  puts "\n\nFile #{ARGV[0]} does not exist. Nothing to process. Exit.\n\n"
  exit
end

movies = MovieCollection.new(movie_file)

#movies.all
movies.all.each {|movie| puts "#{movie.title}"}

# sort_by something
movies.sort_by(:date).each { |movie| puts "#{movie.title} #{movie.date}" }


# filter by some key - value

movies.filter(year: 2001..2010, country: /France|USA/).each { |movie| puts "\"#{movie.title}\", #{movie.year}, #{movie.country}" }

# statistics by some property

movies.stats(:month).each { |e| puts "#{e[0]}, #{e[1]}" }


# some Output
puts movies.all.first.date

# has_genre?('Comedy')
#movies.all.find_all { |e| puts "#{e.title}, has genre = Comedy?: #{e.has_genre?("Comedy")}" }

#throwing exception
movies.all.find_all { |movie| puts "#{movie.title}  #{movie.has_genre?('Comeddd2y')}" }