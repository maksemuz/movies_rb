require './movie.rb'
require './movie_collection.rb'
require './theatre.rb'
describe Theatre do
  movie_file = "./movies.txt"
  theatre = Theatre.new(movie_file)
  it '.show' do
    expect(theatre.show(21).genre).to include('Drama').or include('Crime').or include('Horror')
    expect(theatre.show(10)).to be_a(Movie)
    expect {theatre.show(00)}.to raise_error('There are no films to watch at this time. Sorry.')
  end

  it '.when' do
    expect(theatre.when?("The Wizard of Oz")).to eq("The Wizard of Oz. You can watch it at morning time, 8:00 - 12:00")
  end
end