# frozen_string_literal: true
module Kino
  require './cash_box.rb'
  # Netflix class inherits the MovieCollection.
  # It's created for online cinema, some methods are added
  class Netflix < MovieCollection
    extend Cashbox

    attr_reader :user_account

    def initialize(movie_file)
      super(movie_file)
      @user_account = Money.new(0, 'USD')
      @requests = {}
    end

    def pay(amount)
      @user_account += amount
      self.class.pay(amount)
      raise ArgumentError "Error: #{@user_account}"\
        unless @user_account != Money.new(0, 'USD')
      @user_account.format
    end

    def show(parameters = {}, &block)
      films = if plain_filters?(parameters, &block)
        filter(parameters)
      elsif saved_searches?(parameters)
        all.find_all &@requests[parameters]
      else
        raise ArgumentError, "Your request #{parameters} is incorrect. Please correct it."
      end
      raise ArgumentError, 'Nothing matches your request,'\
        ' please correct it' if films.nil?
      get_film(get_rnd_film(films))
    end

    def how_much?(movie_name)
      movie = all.find { |val| val.title == movie_name }
      raise ArgumentError, "There is no film named #{movie_name} in our collection."\
        "Sorry." unless movie
      puts " \"#{movie.title}\". Cost = #{movie.price}"
      movie.price.format
    end

    def define_filter(name, from: nil, arg: nil, &filter)
      raise ArgumentError, "Filter name #{name} already exists."\
        "Please choose another one." if @requests.key?(name)
      @requests[name] = if !filter && !from.nil? && !arg.nil?
         -> (item) { @requests[from].call(item, arg) }
      else
        filter
      end
    end

    private
    def plain_filters?(filters, &block)
      all.first.methods.include?(filters.keys.first) || block
    end

    def saved_searches?(searches)
      case searches
        when Symbol
          @requests[searches]
        when Hash
          searches.size == 1 && @requests.key?(searches.keys.first)
      end
    end

    def get_film(to_watch)
      dur = to_watch.duration
      start_time = Time.now
      end_time = start_time + (dur * 60)
      raise ArgumentError, "There is not enough money to watch #{to_watch.title}."\
        "Your balance is #{@user_account.format}." \
        unless (@user_account - to_watch.price) >= Money.new(0, 'USD')
      @user_account -= to_watch.price
      puts "Now showing: #{to_watch.long_title}."\
        "#{start_time.strftime('%H:%M')} - #{end_time.strftime('%H:%M')}"
      puts "Price is #{to_watch.price.format}."\
        "Now your balance is: #{Money.new(@user_account, 'USD').format}"
      to_watch
    end

  end
end
