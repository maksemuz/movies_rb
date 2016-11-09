require 'rspec/its'
require './movie.rb'
require './movie_collection.rb'

Encoding.default_external = 'UTF-8'

describe ModernMovie do
  subject do
    MovieCollection.new("./movies.txt").all.find_all { |movie| movie if movie.class == ModernMovie}.sample
  end

  it { is_expected.to be_an ModernMovie }

  its(:year) { is_expected.to match(1968...2000) }

  its(:price) { is_expected.to eq 3 }

  its(:long_title)  { is_expected.to be_a String }

  its(:long_title)  { is_expected.to include('современное кино') }

end