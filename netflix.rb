module Kino
  require './cash_box.rb'

  class Netflix < MovieCollection
    extend Cashbox

    attr_reader :user_account

    def initialize(movie_file)
      super(movie_file)
      @user_account =  Money.new(0, 'USD')
      @requests = {}
    end

    def pay(amount)
      @user_account += amount
      self.class.pay(amount)
      raise ArgumentError "Error: #{@user_account}" unless @user_account != Money.new(0, 'USD')
      @user_account.format
    end

    def show(parameters = {}, &block)
      if !parameters.empty? && @requests[parameters] == nil
        films = filter(parameters)
      elsif block
        films = all.find_all &block
      else
        films = all.find_all &@requests[parameters]
      end
      raise ArgumentError, 'Nothing matches your request, please correct it' unless films.size > 0
      to_watch = get_rnd_film(films)
      dur = to_watch.duration
      start_time = Time.now
      end_time = start_time + (dur * 60)
      raise ArgumentError, "There is not enough money to watch #{to_watch.title}. Your balance is #{@user_account.format}." unless (@user_account - to_watch.price) >= Money.new(0, 'USD')
      @user_account -= to_watch.price
      puts "Now showing: #{to_watch.long_title}. #{start_time.strftime('%H:%M')} - #{end_time.strftime('%H:%M')}"
      puts "Price is #{to_watch.price.format}. Now your balance is: #{Money.new(@user_account, 'USD').format}"
      to_watch
    end

    def how_much?(movie_name)
      movie = all.find { |val| val.title == movie_name }
      raise ArgumentError, "There is no film named #{movie_name} in our collection. Sorry." unless movie
      puts " \"#{movie.title}\". Cost = #{movie.price}"
      movie.price.format
    end

    def define_filter(name, &filter)
      @requests[name] = filter
    end
  end
end
