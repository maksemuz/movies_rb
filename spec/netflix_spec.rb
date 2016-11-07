require './movie.rb'
require './movie_collection.rb'
require './netflix.rb'

Encoding.default_external = 'UTF-8'

describe Netflix do
  movie_file = "./movies.txt"
  netflix = Netflix.new(movie_file)
  amount = 25

  it '.pay ' do
    netflix.pay(amount)
    expect(netflix.money) == "Your balance: $#{amount}"
  end

  it '.how_much' do
    movie = "The Terminator"
    expect(netflix.how_much?(movie)).to eq(3)
    expect {netflix.how_much?("Very special film")}.to raise_error( ArgumentError, "There is no film named Very special film in our collection. Sorry.")
  end

  it '.show' do
    expect(netflix.show(period: 'new', genre: 'Comedy').genre).to include('Comedy')

  end

end