
class Netflix < MovieCollection
  attr_accessor :money

  def initialize(movie_file)
    super(movie_file)
    @money = 0.0
  end

  def show(parameters)
    films = filter(parameters)
    to_watch = get_rnd_film(films)
    dur = to_watch.duration
    start_time = Time.now
    end_time = start_time + (dur * 60)
    @money -= to_watch.price
    puts "Now showing: #{to_watch.long_title}. #{start_time.strftime("%H:%M")} - #{end_time.strftime("%H:%M")}"
    puts "Price is #{to_watch.price}. Now your balance is: #{@money}"
    to_watch
  end

  def pay(amount)
    @money += amount
  end

  def how_much?(movie_name)
    movie = self.all.find { |val| val.title == movie_name}
    raise ArgumentError, "There is no film named #{movie_name} in our collection. Sorry." unless movie
    puts " \"#{movie.title}\". Cost = #{movie.price}"
    movie.price

  end
end
