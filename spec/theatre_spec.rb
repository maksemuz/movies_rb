require 'rspec/its'
require './cash_box.rb'
require './movie.rb'
require './ancient_movie.rb'
require './classic_movie.rb'
require './modern_movie.rb'
require './new_movie.rb'
require './movie_collection.rb'
require './netflix.rb'
require './theatre.rb'

Encoding.default_external = 'UTF-8'

include Kino
describe Theatre do


  context 'Neighbor cinema' do
    let (:neigbor_cinema) { Theatre.new('./movies.txt') }

    it '.show genre' do
      expect(neigbor_cinema.show(21).genre).to include('Drama').or include('Crime').or include('Horror')
    end
    it 'show out of range ' do
      expect {neigbor_cinema.show(00)}.to raise_error(ArgumentError,'There are no films to watch at this time. Sorry.')
    end
    it '.when' do
      expect(neigbor_cinema.when?("The Wizard of Oz")).to match(8...12)
    end
    it 'no such a film' do
      expect { neigbor_cinema.when?("The Big Boss Ozzy") }.to raise_error ArgumentError
    end
    it 'buy_ticket' do
      expect { neigbor_cinema.buy_ticket("The Wizard of Oz") }.to change{neigbor_cinema.cash}
                                                                     .from("$0.00")
                                                                     .to("$3.00")
    end
    it 'cash ' do
      neigbor_cinema.buy_ticket("The Wizard of Oz")
      expect(neigbor_cinema.cash).to eq("$3.00")
    end
    it 'wrong take' do
      expect {neigbor_cinema.take("to me")}.to raise_error(ArgumentError,'Your transaction looks criminal and is rejected. Calling the police.')
    end
    it 'take to bank ' do
      expect(neigbor_cinema.take("Bank")).to eq("Transaction was accepted.")
    end
  end


  context 'Large screen' do
    let (:large_screen) { Theatre.new('./movies.txt') }

    it '.show genre' do
      expect(large_screen.show(21).genre).to include('Drama').or include('Crime').or include('Horror')
    end
    it 'show out of range ' do
      expect {large_screen.show(00)}.to raise_error(ArgumentError,'There are no films to watch at this time. Sorry.')
    end
    it '.when' do
      expect(large_screen.when?("The Wizard of Oz")).to match(8...12)
    end
    it 'buy_ticket' do
      expect { large_screen.buy_ticket("The Wizard of Oz") }.to change{large_screen.cash}
                                                                      .from("$0.00")
                                                                      .to("$3.00")
    end
    it 'cash ' do
      large_screen.buy_ticket("The Wizard of Oz")
      expect(large_screen.cash).to eq("$3.00")
    end
    it 'wrong take' do
      expect {large_screen.take("to me")}.to raise_error(ArgumentError,'Your transaction looks criminal and is rejected. Calling the police.')
    end
    it 'take to bank ' do
      expect(large_screen.take("Bank")).to eq("Transaction was accepted.")
    end
  end

end
