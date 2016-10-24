require './movie.rb'
require './movie_collection.rb'
require './netflix.rb'\

Encoding.default_external = 'UTF-8'

describe Netflix do
  movie_file = "./movies.txt"
  netflix = Netflix.new(movie_file)
  amount = 25
  movie = "The Terminator"

  it '.pay ' do
    netflix.pay(amount)
    expect(netflix.money) == "Your balance: $#{amount}"
  end

  it '.how_much' do
    expect(netflix.how_much?(movie)).to eq(3)
  end

  it '.show' do
    expect(netflix.show(period: 'classic', genre: 'Comedy').genre).to include('Comedy')

  end

end