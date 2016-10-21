#!/usr/bin/env ruby

Encoding.default_external = 'UTF-8'

require './movie.rb'
require './movie_collection.rb'
require './netflix.rb'
require './theatre.rb'
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
puts "\n\n### filter by some key - value\n\n"
movies.filter(period: 'new', genre: 'Comedy').each { |movie| puts "\"#{movie.title}\", #{movie.year}, #{movie.genre}" }

# statistics by some property

#movies.stats(:month).each { |e| puts "#{e[0]}, #{e[1]}" }


# some Output
#puts movies.all.first.date

# has_genre?('Comedy')
#movies.all.find_all { |e| puts "#{e.title}, #{e.genre}, #{e.has_genre?("Comedy")}" }

#movie_file = "./movies.txt"
puts "\n\n### The Netflix show ###\n"
netflix = Netflix.new(movie_file)
puts netflix.how_much?("The Terminator")

puts "\n\n###### The Theatre show ######\n---------------------------------\n"

movie_file = "./movies.txt"
theatre = Theatre.new(movie_file)
puts theatre.show(10)

puts "\n\n###### The Theatre when ######\n---------------------------------\n"

theatre.when?("The Wizard of Oz")
