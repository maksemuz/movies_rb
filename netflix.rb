
class Netflix < MovieCollection
  attr_accessor :money

  def initialize(movie_file)
    super(movie_file)
    @money = 10.0
  end

  def show(parameters)
    to_watch = filter(parameters).sample
    dur = to_watch.duration
    start_time = Time.now;
    end_time = start_time + (dur * 60);
    puts "Now showing: #{to_watch.output}. #{start_time.strftime("%H:%M")} - #{end_time.strftime("%H:%M")}"
    puts "Price is #{to_watch.price}. Now your balance is: #{@money - to_watch.price}"
    to_watch
  end

  def pay(amount)
    @money += amount
    puts "You've paid #{amount}.\nYour balance is: 10 starter + #{amount} = #{@money}"
  end

  def how_much?(movie_name)
    movie = self.all.find { |val| val.title == movie_name}
    raise 'There is no such film in our collection. Sorry.' if not movie
    puts " \"#{movie.title}\". Cost = #{movie.price}"
    movie.price

  end
end
