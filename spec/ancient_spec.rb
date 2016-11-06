require './movie.rb'
require './movie_collection.rb'

Encoding.default_external = 'UTF-8'

describe AncientMovie do
  movie_file = "./movies.txt"
  film = MovieCollection.new(movie_file).all.find_all { |movie| movie if movie.class == AncientMovie}.sample
  puts "Title: \"#{film.title}\", Year: #{film.year}, Price: #{film.class::PRICE}"


  it 'initialize' do
    expect(film.class::PRICE) == 1
    expect(film).to be_an(AncientMovie)
    expect(film.year).to be <= 1945
  end

  it 'long_title' do
    expect(film.long_title).to be_a(String)
  end

end
