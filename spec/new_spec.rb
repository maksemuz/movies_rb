require './movie.rb'
require './movie_collection.rb'

Encoding.default_external = 'UTF-8'

describe NewMovie do
  movie_file = "./movies.txt"
  film = MovieCollection.new(movie_file).all.find_all { |movie| movie if movie.class == NewMovie}.sample
  puts "Title: \"#{film.title}\", Year: #{film.year}, Price: #{film.class::PRICE}"


  it 'initialize' do
    expect(film.class::PRICE) == 5
    expect(film).to be_an(NewMovie)
  end

  it 'year' do
    expect(film.year).to be > 2000
  end

  it 'get_word' do
    expect(film.get_word(21)).to eq('год')
    expect(film.get_word(1)).to eq('год')
    expect(film.get_word(11)).to eq('лет')
    expect(film.get_word(14)).to eq('лет')
    expect(film.get_word(23)).to eq('года')
    expect(film.get_word(4)).to eq('года')
  end

  it 'long_title' do
    expect(film.long_title).to be_a(String)
  end

end