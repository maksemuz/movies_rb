require 'rspec/its'
require './movie.rb'
require './movie_collection.rb'
require './netflix.rb'

Encoding.default_external = 'UTF-8'

describe Netflix do
  subject do
    Netflix.new('./movies.txt')
  end

  context '.pay ' do
    netflix = Netflix.new('./movies.txt')
    netflix.pay(25)
    expect(netflix.money).to eq(25)
  end

  context '.how_much' do
    netflix = Netflix.new('./movies.txt')
    movie = "The Terminator"
    wrong_movie = "Very special film"
    expect(netflix.how_much?(movie) ).to eq(3)
    expect {netflix.how_much?(wrong_movie) }.to raise_error( ArgumentError, "There is no film named Very special film in our collection. Sorry.")
  end

  context '.show' do
    netflix = Netflix.new('./movies.txt')
    expect(netflix.show(period: 'new', genre: 'Comedy').genre).to include('Comedy')

  end

end
