require 'rspec/its'
require './movie.rb'
require './movie_collection.rb'

Encoding.default_external = 'UTF-8'

describe ClassicMovie do
  subject do
    MovieCollection.new("./movies.txt").all.find_all { |movie| movie if movie.class == ClassicMovie}.sample
  end

  it { is_expected.to be_an ClassicMovie }

  its(:year) { is_expected.to match(1945...1968) }

  its(:price) { is_expected.to eq 1.5 }

  its(:long_title)  { is_expected.to be_a String }

  its(:long_title)  { is_expected.to include('классический фильм') }

end