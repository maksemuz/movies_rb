require 'rspec/its'
require './movie.rb'
require './ancient_movie.rb'
require './classic_movie.rb'
require './modern_movie.rb'
require './new_movie.rb'
require './movie_collection.rb'
require './netflix.rb'
require './theatre.rb'
require 'ostruct'
require 'date'
require 'money'

Encoding.default_external = 'UTF-8'

describe "Kino" do
  include Kino
  context "kino_online" do


    kino_online = Netflix.new('./movies.txt')
    payment = Money.from_amount(30,"USD")
    movie = "The Terminator"
    wrong_movie = "Very special film"
    it 'pay' do
      expect(Netflix.pay(payment)).to eq("$30.00")
    end
    it 'cash' do
      expect(Netflix.cash).to eq("$30.00")
    end
    it '.show' do
      expect(kino_online.show(period: 'new', genre: 'Comedy').genre).to include('Comedy')
    end
    it '.how_much' do
      expect(kino_online.how_much?(movie) ).to eq("$3.00")
      expect {kino_online.how_much?(wrong_movie) }.to raise_error( ArgumentError, "There is no film named Very special film in our collection. Sorry.")
    end
    it 'take' do
      expect {Netflix.take("to me")}.to raise_error(ArgumentError,'Your transaction looks criminal and is rejected. Calling the police.')
      expect(Netflix.take("Bank")).to eq("Transaction was accepted.")
    end

  end

  context "web_cinema" do
    web_cinema = Netflix.new('./movies.txt')
    payment = Money.from_amount(40,"USD")
    movie = "The Terminator"
    wrong_movie = "Very special film"
    it 'pay' do
      expect(Netflix.pay(payment)).to eq("$40.00")
    end
    it 'cash' do
      expect(Netflix.cash).to eq("$40.00")
    end
    it '.show' do
      expect(web_cinema.show(period: 'new', genre: 'Comedy').genre).to include('Comedy')
    end
    it '.how_much' do
      expect(web_cinema.how_much?(movie) ).to eq("$3.00")
      expect {web_cinema.how_much?(wrong_movie) }.to raise_error( ArgumentError, "There is no film named Very special film in our collection. Sorry.")
    end
    it 'take' do
      expect {Netflix.take("to me")}.to raise_error(ArgumentError,'Your transaction looks criminal and is rejected. Calling the police.')
      expect(Netflix.take("Bank")).to eq("Transaction was accepted.")
    end

  end
end
