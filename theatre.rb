class Theatre < MovieCollection
  def initialize (movie_file)
    super(movie_file)
    @morning_films = self.filter(period: 'ancient')
    @noon_films = self.filter(genre: 'Adventure') + self.filter(genre: 'Comedy')
    @evening_films = self.filter(genre: 'Drama') + self.filter(genre: 'Horror')
  end

  def show(time)
    if time >= 8 && time < 12
      films = @morning_films
    elsif time >= 12 && time < 16
      films = @noon_films
    elsif time >= 16 && time < 22
      films = @evening_films
    else
      raise 'There are no films to watch at this time. Sorry.'
    end
    to_watch = Random.new.rand(0...films.size-1)
    puts "Now showing: \"#{films[to_watch].title}\",  #{films[to_watch].genre}, duration: #{films[to_watch].duration} min."
    return films[to_watch]

  end

  def when?(movie_name)
    movie = self.all.find { |val| val.title == movie_name}
    if @morning_films.include?(movie)
      puts " #{movie_name}. You can watch it at morning time, 8:00 - 12:00"
    elsif @noon_films.include?(movie)
      puts " #{movie_name}. You can watch it at noon time, 12:00 - 16:00"
    elsif @evening_films.include?(movie)
      puts " #{movie_name}. You can watch it at evening time, 16:00 - 22:00"
    else
      raise "#{movie_name} - this film is out of time or even not a film."
    end

  end
end