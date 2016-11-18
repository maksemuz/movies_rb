require './cash_box.rb'
require 'rspec/its'
require './movie.rb'
require './movie_collection.rb'
require './theatre.rb'

Encoding.default_external = 'UTF-8'

describe Theatre do

  context "Neighbor cinema" do
    movie_file = './movies.txt'
    neigbor_cinema = Theatre.new(movie_file)
    it '.show' do
      expect(neigbor_cinema.show(21).genre).to include('Drama').or include('Crime').or include('Horror')
      expect(neigbor_cinema.show(10)).to be_a(Movie)
      expect {neigbor_cinema.show(00)}.to raise_error(ArgumentError,'There are no films to watch at this time. Sorry.')
    end

    it '.when' do
      expect(neigbor_cinema.when?("The Wizard of Oz")).to match(8...12)
    end

    it 'buy_ticket' do
      expect(neigbor_cinema.buy_ticket("The Wizard of Oz")).to eq("$3.00")
      expect(neigbor_cinema.cash).to eq("$3.00")
    end

    it 'take' do
      expect {neigbor_cinema.take("to me")}.to raise_error(ArgumentError,'Your transaction looks criminal and is rejected. Calling the police.')
      expect(neigbor_cinema.take("Bank")).to eq("Transaction was accepted.")
    end
  end

  context "Big_film" do
    movie_file = './movies.txt'
    big_film = Theatre.new(movie_file)
    it '.show' do
      expect(big_film.show(21).genre).to include('Drama').or include('Crime').or include('Horror')
      expect(big_film.show(10)).to be_a(Movie)
      expect {big_film.show(00)}.to raise_error(ArgumentError,'There are no films to watch at this time. Sorry.')
    end

    it '.when' do
      expect(big_film.when?("The Wizard of Oz")).to match(8...12)
    end

    it 'buy_ticket' do
      expect(big_film.buy_ticket("The Wizard of Oz")).to eq("$3.00")
      expect(big_film.cash).to eq("$3.00")
    end

    it 'take' do
      expect {big_film.take("to me")}.to raise_error(ArgumentError,'Your transaction looks criminal and is rejected. Calling the police.')
      expect(big_film.take("Bank")).to eq("Transaction was accepted.")
    end
  end


end
