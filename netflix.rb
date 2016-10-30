
class Netflix < MovieCollection
  attr_accessor :money

  def initialize(movie_file)
    super(movie_file)
    @money = 10.0
  end

  def show(parameters)
    films = filter(parameters)
    to_watch = films.sample
    dur = to_watch.duration
    start_time = Time.now;
    end_time = start_time + (dur * 60);
    film_cost = to_watch.period
    puts "Now showing: \"#{to_watch.title}\" - #{start_time.strftime("%H:%M")} - #{end_time.strftime("%H:%M")}"
    puts "Price is #{@price[film_cost]}. Now your balance is: #{@money - @price[film_cost]}"
    to_watch
  end

  def pay(amount)
    @money += amount
    puts "Your balance is: $10 starter + #{amount} = #{@money}"
  end

  def how_much?(movie_name)
    movie = self.all.find { |val| val.title == movie_name}
    raise 'There is no such film in our collection. Sorry.' if not movie
    puts " \"#{movie.title}\". Cost = #{@price[movie.period]}"
    @price[movie.period]
  end
end
