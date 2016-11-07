class Theatre < MovieCollection
  def initialize (movie_file)
    super(movie_file)
  end
  SCHEDULE = {8...12 => [{period: 'ancient'}],
              12...18 => [{genre: 'Adventure'},{genre:'Comedy'}],
              18...24 => [{genre: 'Horror'}, {genre: 'Drama'}]}


  def show(time)
    params = SCHEDULE.find { |key,val| val if (key).include?(time) }
    raise ArgumentError,'There are no films to watch at this time. Sorry.' unless params
    films = params[1].map { |param| filter(param)}.flatten
    to_watch = get_rnd_film(films)
    puts "Now showing: \"#{to_watch.title}\",  #{to_watch.genre * ", "}, duration: #{to_watch.duration} min."
    to_watch
  end

  def when?(movie_name)
    movie = self.all.find { |val| val.title == movie_name}
    movie_filters = [movie.period,movie.genre].flatten
    time = SCHEDULE.find { |key,val| key if (val.map { |inst| inst.to_a}.flatten & movie_filters) !=[]}
    raise ArgumentError,"You cannot watch \"#{movie.title}\" in our theatre, it does not match our schedule filters." unless time
    "#{movie_name}. You can watch it at #{time[0].first}:00 - #{time[0].last}:00"
  end
end

