require './movie.rb'
class AncientMovie < Movie
  PRICE = 1

  def long_title
    "#{self.title} — старый фильм (#{self.year} год)"
  end

end
