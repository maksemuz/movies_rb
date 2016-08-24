#!/usr/bin/env ruby

bad_movie = ['Titanic', 'Transformers']
good_movie = ['Matrix', 'Crossroads', 'Treasure planet']

if ARGV.length != 1
        puts "Usage: 'ruby movies_array.rb Movie_name' or 'ruby movies_array.rb \"Movie name\"' . Please try again."
        exit
end
if bad_movie.include?(ARGV[0])
        puts "#{ARGV[0]} is a bad movie"
elsif good_movie.include?(ARGV[0])
        puts "#{ARGV[0]} is a good movie"
else 
        puts "Haven't seen #{ARGV[0]} yet." 
end
