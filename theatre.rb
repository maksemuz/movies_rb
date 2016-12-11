# frozen_string_literal: true
module Kino
  require './cash_box.rb'
  # Theatre class inherits the MovieCollection.
  # It's created for real cinema, some methods are added
  class Theatre < MovieCollection
    include Cashbox

    def initialize(movie_file)
      super(movie_file)
      @cash_box = Money.new(0, 'USD')
    end
    SCHEDULE = {
      8...12 => { period: 'ancient' },
      12...18 => { genre: 'Adventure' },
      12...18 => { genre: 'Comedy' },
      18...24 => { genre: 'Horror' },
      18...24 => { genre: 'Drama' }
    }.freeze
    PRICE = {
      8...12 => Money.from_amount(3, 'USD'),
      12...18 =>  Money.from_amount(5, 'USD'),
      18...24 =>  Money.from_amount(10, 'USD')
    }.freeze

    def price
      self.class::PRICE
    end

    # this method shows random film according to given time
    # time should be given as a number of hours in 24-hrs format
    def show(time)
      parameter = SCHEDULE.find { |key, val| val if key.include?(time) }
      raise ArgumentError, 'There are no films to watch at this time. Sorry.' unless parameter
      films = filter(parameter[1])
      to_watch = get_rnd_film(films)
      puts "Now showing: \"#{to_watch.title}\",  #{to_watch.genre * ', '}, \
duration: #{to_watch.duration} min."
      to_watch
    end

    # this method shows time when you can watch the movie
    def when?(movie_name)
      movie = all.find do |val|
        val.title == movie_name
      end
      raise ArgumentError, "We could not find the \"#{movie}\" in our collection" unless movie
      time = SCHEDULE.find do |key, val|
        key if movie.matches?(val.to_a.flatten[0], val.to_a.flatten[1])
      end
      raise ArgumentError, "You cannot watch \"#{movie.title}\" in our theatre, \
it does not match our schedule filters." unless time
      puts "#{movie_name}. You can watch it at #{time[0].first}:00 - #{time[0].last}:00"
      time[0]
    end

    def buy_ticket(movie_name)
      time = when?(movie_name)
      raise ArgumentError, "!!! Theatre.buy_ticket : tinme is: #{time}" unless time
      price = self.price[time]
      raise ArgumentError, "!!! price #{price.class}" unless price
      puts "You have bought a ticket to \"#{movie_name}\"."
      pay(price)
    end
  end
end
