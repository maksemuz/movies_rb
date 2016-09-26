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
movies.filter(genre: "Comedy",year: 2009).each { |e| puts " #{e.year}, \"#{e.title }\", #{e.genre}"}

# statistics by some property
puts movies.stats(:year)

# some Output
puts movies.all.first.main_actors

# has_genre?('Comedy')
movies.all.find_all { |e| puts "#{e.title}, has genre = Comedy?: #{e.has_genre?("Comedy")}" }