#!/usr/bin/env ruby


if ARGV.length == 0
  puts "You did not enter filename. Using movies.txt"
  movie_file = "movies.txt"
else
    movie_file = ARGV[0]
end
if !File.exist?(movie_file)
  puts "File #{ARGV[0]} does not exist. Nothing to process. Exit."
  exit
end

f = File.readlines(movie_file)
f.each do |line|
  line.force_encoding(Encoding::UTF_8)
  amovie = line.split("|")
  stars = amovie[7].to_s.split(".")
  if stars[0].to_i > 8
    i = stars[1].to_i + 10
  else
    i = stars[1].to_i
  end
  if amovie[1].include?("Time")
      puts "#{amovie[1]} #{"*" * i}"
  end
end
