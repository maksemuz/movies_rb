require './cash_box.rb'

class Theatre < MovieCollection
  include Cashbox

  def initialize (movie_file)
    super(movie_file)
    @cash_box = 0.0
  end
  SCHEDULE = {
      8...12 => {period: 'ancient'},
      12...18 => {genre: 'Adventure'},
      12...18 => {genre:'Comedy'},
      18...24 => {genre: 'Horror'},
      18...24 => {genre: 'Drama'}
  }
  PRICE = {
      8...12 =>  Money.from_amount(3,"USD"),
      12...18 =>  Money.from_amount(5,"USD"),
      18...24 =>  Money.from_amount(10,"USD")
  }

  def price
    self.class::PRICE
  end

  # this method shows random film according to given time
  # time should be given as a number of hours in 24-hrs format
  def show(time)
    parameter = SCHEDULE.find { |key,val| val if (key).include?(time) }
    raise ArgumentError,'There are no films to watch at this time. Sorry.' unless parameter
    films = filter(parameter[1])
    to_watch = get_rnd_film(films)
    puts "Now showing: \"#{to_watch.title}\",  #{to_watch.genre * ", "}, \
duration: #{to_watch.duration} min."
    to_watch
  end

  # this method shows time when you can watch the movie
  def when?(movie_name)
    movie = self.all.find { |val| val.title == movie_name}
    time = SCHEDULE.find { |key,val| key if movie.matches?(val.to_a.flatten[0],val.to_a.flatten[1])}
    raise ArgumentError,"You cannot watch \"#{movie.title}\" in our theatre, \
it does not match our schedule filters." unless time
    puts "#{movie_name}. You can watch it at #{time[0].first}:00 - #{time[0].last}:00"
    time[0]
  end
end

