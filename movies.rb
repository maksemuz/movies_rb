#!/usr/bin/env ruby

bad_movie = "Titanic"
good_movie = "Matrix"

if ARGV.length != 1
        puts "Usage: 'ruby movies.rb Movie_name' or 'ruby movies.rb \"Movie name\"' . Please try again."
        exit
end
if ARGV[0] == bad_movie
        puts "#{ARGV[0]} is a bad movie"
elsif ARGV[0] == good_movie
        puts "#{ARGV[0]} is a good movie"
else 
        puts "Haven't seen #{ARGV[0]} yet." 
end
