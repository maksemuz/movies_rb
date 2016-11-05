class Theatre < MovieCollection
  def initialize (movie_file)
    super(movie_file)
  end
  SCHEDULE = {12 => [{period: 'ancient'}],
              18 => [{genre: 'Adventure'},{genre:'Comedy'}],
              24 => [{genre: 'Horror'}, {genre: 'Drama'}]}

  def show(time)
    params = SCHEDULE.find { |key,value| value if (key-6...key).include?(time) }
    raise ArgumentError,'There are no films to watch at this time. Sorry.' unless params
    to_watch = params[1].map { |param| filter(param)}.flatten.sample
    puts "Now showing: \"#{to_watch.title}\",  #{to_watch.genre * ", "}, duration: #{to_watch.duration} min."
    to_watch
  end

  def when?(movie_name)
    movie = self.all.find { |val| val.title == movie_name}
    time_range = SCHEDULE.find {|key,val| key if val.include?(movie)}[0]
    "#{movie_name}. You can watch it at #{stime_range.first}:00 - #{time_range.last}:00"
  end
end









