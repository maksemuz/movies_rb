#!/usr/bin/env ruby

Encoding.default_external = 'UTF-8'

require './Movie_class.rb'
require './MovieCollection_class.rb'
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

movies = MovieCollection.new(movie_file)

# sort_by something
movies.all
  .sort_by { |e| e.date }
  .each { |e|  puts "#{e.title} #{e.date}"}
=end

# filter by some key - value
movies.filter(director: 'Hayao Miyazaki').each { |e| puts "#{e.title}  #{e.genre}" }

# statistics by some property
movies.stats(:director).sort_by { |e| e[1].size }.each { |e| puts "#{e[0]} #{e[1].size}" }

# some Output
puts movies.all.first.main_actors
