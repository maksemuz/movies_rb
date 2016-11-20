module Kino
  require './cash_box.rb'


  class Netflix < MovieCollection
    extend Cashbox

    attr_reader :user_account

    def initialize(movie_file)
      super(movie_file)
      @user_account =  Money.new(0, "USD")
    end

    def pay(amount)
      @user_account += amount
      self.class.pay(amount)
      @user_account
    end

    def show(parameters)
      films = filter(parameters)
      to_watch = get_rnd_film(films)
      dur = to_watch.duration
      start_time = Time.now
      end_time = start_time + (dur * 60)
      raise ArgumentError, "There is not enough money to watch #{to_watch.title}.\n Your balance is #{@user_account}." unless (@user_account - to_watch.price) >= 0
      @user_account -= to_watch.price
      puts "Now showing: #{to_watch.long_title}. #{start_time.strftime("%H:%M")} - #{end_time.strftime("%H:%M")}"
      puts "Price is #{to_watch.price.format}. Now your balance is: #{Money.new(@user_account,"USD").format}"
      to_watch
    end

    def how_much?(movie_name)
      movie = self.all.find { |val| val.title == movie_name}
      raise ArgumentError, "There is no film named #{movie_name} in our collection. Sorry." unless movie
      puts " \"#{movie.title}\". Cost = #{movie.price}"
      movie.price.format

    end
  end

end
