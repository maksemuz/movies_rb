#!/usr/bin/env ruby

Encoding.default_external = 'UTF-8'
require './movie.rb'
require './ancient_movie.rb'
require './classic_movie.rb'
require './modern_movie.rb'
require './new_movie.rb'
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

# sort_by something
#movies.sort_by(:director).each { |movie| puts "#{movie.title} #{movie.date}" }

# statistics by some property

#movies.stats(:month).each { |e| puts "#{e[0]}, #{e[1]}" }
=begin
films = movies.filter(period: 'classic')
puts movies.get_rnd_film(films)

# some Output
#puts movies.all.first.date

# has_genre?('Comedy')
#movies.all.find_all { |e| puts "#{e.title}, #{e.genre}, #{e.has_genre?("Comedy")}" }



movie_file = "./movies.txt"
puts "\n\n###### The Netflix show ######\n---------------------------------\n"
netflix = Netflix.new(movie_file)
#puts netflix.how_much?("The Terminator")
netflix.show(period: 'classic')

#netflix.all.each { |movie| puts "#{movie.director}"}

=end

movie_file = "./movies.txt"
theatre = Theatre.new(movie_file)

puts "\n\n###### The Theatre show ######\n---------------------------------\n"
theatre.show(20)

puts "\n\n###### The Theatre when ######\n---------------------------------\n"
puts theatre.when?("Downfall")
puts theatre.when?("The Wizard of Oz")
puts theatre.when?("The Terminator")
#movies.all
#puts "\n\n### all show ###\n"
#movies.all.each {|movie| puts "#{movie.output}"}

