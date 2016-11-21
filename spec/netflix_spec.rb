require 'rspec/its'
require './movie.rb'
require './movie_collection.rb'
require './netflix.rb'
require './cash_box.rb'

Encoding.default_external = 'UTF-8'

include Kino
describe Netflix do

  context 'kino_online' do
    let (:kino_online) { Netflix.new('./movies.txt') }
    let (:payment) { Money.from_amount(30,'USD') }
    let (:movie_to_test) { 'The Terminator' }
    let (:wrong_movie) { 'Very special film' }
    it 'pay' do
      expect(kino_online.pay(payment)).to eq('$30.00')
    end
    it 'cash' do
      expect(Netflix.cash).to eq('$30.00')
    end
    it '.show' do
      kino_online.pay(payment)
      expect(kino_online.show(period: 'new', genre: 'Comedy').genre).to include('Comedy')
    end
    it '.how_much - movie' do
      expect(kino_online.how_much?(movie_to_test) ).to eq('$3.00')
    end
    it '.how_much - wrong movie' do
      expect {kino_online.how_much?(wrong_movie) }.to raise_error( ArgumentError, 'There is no film named Very special film in our collection. Sorry.')
    end
    it 'take - wrong' do
      expect {Netflix.take('to me')}.to raise_error(ArgumentError,'Your transaction looks criminal and is rejected. Calling the police.')
    end
    it 'take to Bank' do
      expect(Netflix.take('Bank')).to eq('Transaction was accepted.')
    end

  end

  context 'web_cinema' do
    let (:web_cinema) { Netflix.new('./movies.txt') }
    let (:payment) { Money.from_amount(40,'USD') }
    let (:movie_to_test) { 'The Terminator' }
    let (:wrong_movie) { 'Very special film' }
    it 'pay' do
      expect(web_cinema.pay(payment)).to eq('$40.00')
    end
    it 'cash' do
      expect(Netflix.cash).to eq('$40.00')
    end
    it '.show' do
      web_cinema.pay(payment)
      expect(web_cinema.show(period: 'new', genre: 'Comedy').genre).to include('Comedy')
    end
    it '.how_much - movie' do
      expect(web_cinema.how_much?(movie_to_test) ).to eq('$3.00')
    end
    it '.how_much - wrong movie' do
      expect {web_cinema.how_much?(wrong_movie) }.to raise_error( ArgumentError, 'There is no film named Very special film in our collection. Sorry.')
    end
    it 'take - wrong' do
      expect {Netflix.take('to me')}.to raise_error(ArgumentError,'Your transaction looks criminal and is rejected. Calling the police.')
    end
    it 'take to Bank' do
expect(Netflix.take('Bank')).to eq('Transaction was accepted.')
    end

  end


end
