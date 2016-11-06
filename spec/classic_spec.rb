require './movie.rb'
require './movie_collection.rb'

Encoding.default_external = 'UTF-8'

describe ClassicMovie do
  movie_file = "./movies.txt"
  film = MovieCollection.new(movie_file).all.find_all { |movie| movie if movie.class == ClassicMovie}.sample
  puts "Title: \"#{film.title}\", Year: #{film.year}, Price: #{film.class::PRICE}"


  it 'initialize' do
    expect(film.class::PRICE) == 1.5
    expect(film).to be_an(ClassicMovie)
  end

  it 'year' do
    expect(film.year).to be > 1945
    expect(film.year).to be <= 1968
  end

  it 'long_title' do
    expect(film.long_title).to be_a(String)
  end

end