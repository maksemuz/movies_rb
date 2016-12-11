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
      if !parameters.empty? && (@requests[parameters].nil?\
        && @requests[parameters.keys[0]].nil?)
        puts "===111=== #{parameters}"
        films = filter(parameters)
      elsif block && parameters.empty?
        puts "===222=== #{parameters}"
        films = all.find_all &block
      elsif parameters.class == Hash && !parameters.empty?
        puts "===333=== #{parameters} == #{parameters.keys[0]} "
        films = all.find_all &@requests[parameters]
      else
        puts "===444=== #{parameters}"
        films = all.find_all &@requests[parameters]
      end
      raise ArgumentError, 'Nothing matches your request,'\
      ' please correct it' if films.nil?
      get_film(get_rnd_film(films))
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

    def how_much?(movie_name)
      movie = all.find { |val| val.title == movie_name }
      raise ArgumentError, "There is no film named #{movie_name} in our collection."\
      "Sorry." unless movie
      puts " \"#{movie.title}\". Cost = #{movie.price}"
      movie.price.format
    end

    def define_filter(params, &filter)
      raise ArgumentError, "Filter name #{params} already exists."\
      "Please choose another one." unless @requests[params].nil?
      if params.class == Hash
        @requests[params[:name]] = ->(item) { @requests[params[:from]].call(item, params[:arg]) }
      else
        @requests[params] = filter
      end
    end
  end
end
