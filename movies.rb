#!/usr/bin/env ruby

f = File.open("movies.txt", "r")

text = f.each do |line|
  line.force_encoding(Encoding::UTF_8)
  amovie = line.split("|")
  stars = amovie[7].to_s.split(".")
  stars_out = Array.new(stars[1].to_i,"*")
  if amovie[1].include?("Time")
      puts "#{amovie[1]} #{stars_out.join}"
  end
end
