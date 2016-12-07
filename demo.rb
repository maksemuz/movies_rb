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
require 'money'
I18n.enforce_available_locales = false

include Kino

if ARGV.empty?
  puts "\n\nYou did not enter filename. Using movies.txt\n\n"
  movie_file = './movies.txt'
else
  movie_file = ARGV[0]
end
unless File.exist?(movie_file)
  puts "\n\nFile #{ARGV[0]} does not exist. Nothing to process. Exit.\n\n"
  exit
end

# movies = Kino::MovieCollection.new(movie_file)

# sort_by something
# movies.sort_by(:director).each { |movie| puts "#{movie.title} #{movie.date}" }

# statistics by some property

# movies.stats(:month).each { |e| puts "#{e[0]}, #{e[1]}" }

# films = movies.filter(period: 'classic')
# puts movies.get_rnd_film(films)

# some Output
# puts movies.all.first.date

# has_genre?('Comedy')
# movies.all.find_all { |e| puts "#{e.title}, #{e.genre}, #{e.has_genre?("Comedy")}" }

movie_file = './movies.txt'
payment1 = Money.from_amount(30, 'USD')

netflix = Kino::Netflix.new(movie_file)
puts "\n\n###### The Netflix show: netflix ######\n---------------------------------\n"
# puts netflix.inspect
netflix.pay(payment1)
# puts netflix.how_much?("The Terminator")
#netflix.show(period: 'classic',genre: 'Horror')

puts "=============== test 1 ========================="

look_for_term = lambda { |movie| movie.title.include?('Terminator') && movie.genre.include?('Action') && movie.year < 2003}

netflix.show(look_for_term)


puts "=============== test 2 ========================="

look_for_genres = { period: 'classic',genre: 'Horror' }

netflix.show(look_for_genres)


=begin
netflix.pay(payment2)
# puts netflix.how_much?("The Terminator")
netflix.show(period: 'classic')
puts "======payment: #{payment2.format}"
puts "=====ALL CASH: #{Kino::Netflix.cash} "

online = Kino::Netflix.new(movie_file)
puts "\n\n###### The Netflix show: online ######\n---------------------------------\n"
online.pay(payment3)
# puts netflix.how_much?("The Terminator")
online.show(period: 'new')
puts "======payment: #{payment3.format}"
puts "=====ALL CASH: #{Kino::Netflix.cash} "

online.pay(payment4)
# puts netflix.how_much?("The Terminator")
online.show(period: 'new')
puts "======payment: #{payment4.format}"
puts "=====ALL CASH: #{Kino::Netflix.cash}"


#netflix.all.each { |movie| puts "#{movie.director}"}



movie_file = './movies.txt'
theatre = Theatre.new(movie_file)

puts "\n\n###### The Theatre show ######\n---------------------------------\n"
theatre.show(20)

puts "\n\n###### The Theatre when ######\n---------------------------------\n"
puts theatre.when?('Downfall')
puts theatre.when?('The Wizard of Oz')
# puts theatre.when?("The Terminator")

puts theatre.cash

theatre.buy_ticket('The Wizard of Oz')

puts theatre.cash

# movies.all
# puts "\n\n### all show ###\n"
# movies.all.each {|movie| puts "#{movie.output}"}
=end