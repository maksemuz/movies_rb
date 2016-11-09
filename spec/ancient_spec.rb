require 'rspec/its'
require './movie.rb'
require './movie_collection.rb'

Encoding.default_external = 'UTF-8'

describe AncientMovie do
  subject do
    MovieCollection.new("./movies.txt").all.find_all { |movie| movie if movie.class == AncientMovie}.sample
  end

  it { is_expected.to be_an AncientMovie }

  its(:year) { is_expected.to be <= 1945 }

  its(:price) { is_expected.to eq 1 }

  its(:long_title)  { is_expected.to be_a String }

end

