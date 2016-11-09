require 'rspec/its'
require './movie.rb'
require './movie_collection.rb'
require './theatre.rb'

Encoding.default_external = 'UTF-8'

describe Theatre do

  context '.show' do
    movie_file = './movies.txt'
    theatre = Theatre.new(movie_file)
    expect(theatre.show(21).genre).to include('Drama').or include('Crime').or include('Horror')
    expect(theatre.show(10)).to be_a(Movie)
    expect {theatre.show(00)}.to raise_error('There are no films to watch at this time. Sorry.')
  end

  context '.when' do
    movie_file = "./movies.txt"
    theatre = Theatre.new(movie_file)
    expect(theatre.when?("The Wizard of Oz")).to match("8:00 - 12:00")
  end
end
