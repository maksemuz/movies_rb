#!/usr/bin/env ruby

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
    arr.find_all { |obj| puts "#{obj[:title]} \(#{obj[:date]}; #{obj[:genre]}\) - #{obj[:duration]}"}
    #print obj
end


labels = Array.new
movie_line = Array.new
movie_dict = Hash.new
movies_array = Array.new
labels = [:link, :title, :year, :country, :date, :genre, :duration, :rating, :director, :main_actors]

f = File.readlines(movie_file)
movies_array = f.map { |string|  labels.zip(string.force_encoding(Encoding::UTF_8).split('|')).to_h }

# Output of 5 longest movies
puts "\n5 longest movies\n\n"
var_to_out = movies_array.sort_by { |obj| obj[:duration].split(" ")[0].to_i }.reverse[0..4]
film_out(var_to_out)

# Output of 10 comedies
puts "\n10 oldest comedies\n\n"
var_to_out = movies_array.find_all { |obj| obj[:genre].include?("Comedy") }.sort_by { |obj| obj[:date] }[0..9]
film_out(var_to_out)

# Output of all directors
puts "\nAll diretors sorted by last word of name\n\n"
movies_array.uniq { |obj| obj[:director]  }.sort_by { |obj| obj[:director].split(" ")[obj[:director].split(" ").size - 1] }.find_all { |obj| puts "#{obj[:director]}"}

# Output of non-USA shot films amount
puts "\nAmount of mom-USA shot films\n\n"
puts "#{movies_array.find_all { |obj| obj[:country] != "USA" }.size}"
