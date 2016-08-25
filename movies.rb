#!/usr/bin/env ruby


if ARGV.length == 0
  puts "You did not enter filename. Using movies.txt"
  movie_file = "movies.txt"
elsif File.exist?(ARGV[0])
    movie_file = ARGV[0]
else
  puts "File #{ARGV[0]} does not exist. Using movies.txt"
  movie_file = "movies.txt"
end
puts movie_file
f = File.readlines(movie_file)
for line in f do
  line.force_encoding(Encoding::UTF_8)
  amovie = line.split("|")
  stars = amovie[7].to_s.split(".")
  stars_out = Array.new(stars[1].to_i,"*")
  if amovie[1].include?("Time")
      puts "#{amovie[1]} #{stars_out.join}"
  end
end
