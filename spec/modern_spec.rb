require './movie.rb'
require './movie_collection.rb'

Encoding.default_external = 'UTF-8'

describe ModernMovie do
  movie_file = "./movies.txt"
  film = MovieCollection.new(movie_file).all.find_all { |movie| movie if movie.class == ModernMovie}.sample
  puts "Title: \"#{film.title}\", Year: #{film.year}, Price: #{film.class::PRICE}"


  it 'initialize' do
    expect(film.class::PRICE) == 3
    expect(film).to be_an(ModernMovie)
  end

  it 'year' do
    expect(film.year).to be > 1968
    expect(film.year).to be <= 2000
  end

  it 'long_title' do
    expect(film.long_title).to be_a(String)
  end

end