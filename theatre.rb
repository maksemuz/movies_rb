
class Theatre < MovieCollection
  def initialize (movie_file)
    super(movie_file)
    @morning_films = filter(period: 'ancient')
    @noon_films = filter(genre: 'Adventure') + filter(genre: 'Comedy')
    @evening_films =filter(genre: 'Drama') + filter(genre: 'Horror')
    @schedule = {(8...12) => @morning_films,(12...18) => @noon_films, (18..24) => @evening_films }
  end

  def show(time)
    time_range = @schedule.keys.find { |key| key if key.include?(time) }
    raise 'There are no films to watch at this time. Sorry.' if not time_range
    to_watch = @schedule[time_range].sample
    puts "Now showing: \"#{to_watch.title}\",  #{to_watch.genre * ", "}, duration: #{to_watch.duration} min."
    return to_watch
  end

  def when?(movie_name)
    movie = self.all.find { |val| val.title == movie_name}
    time_range = @schedule.find {|key,val| key if val.include?(movie)}[0]
    out = "#{movie_name}. You can watch it at #{time_range.first}:00 - #{time_range.last}:00"
    out
  end
end
