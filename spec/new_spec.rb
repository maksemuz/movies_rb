require 'rspec/its'
require './movie.rb'
require './movie_collection.rb'

Encoding.default_external = 'UTF-8'

describe NewMovie do
  subject do
    MovieCollection.new("./movies.txt").all.find_all { |movie| movie if movie.class == NewMovie}.sample
  end

  it { is_expected.to be_an NewMovie }

  its(:year) { is_expected.to be >= 2000 }

  its(:price) { is_expected.to eq 5 }

  its(:long_title)  { is_expected.to be_a String }

  its(:long_title)  { is_expected.to include('новинка') }

  it 'get_word' do
    movie = MovieCollection.new("./movies.txt").all.find_all { |movie| movie if movie.class == NewMovie}.sample
    expect(movie.get_word(1)).to eq('год')
    expect(movie.get_word(11)).to eq('лет')
    expect(movie.get_word(14)).to eq('лет')
    expect(movie.get_word(23)).to eq('года')
    expect(movie.get_word(4)).to eq('года')
  end

end
