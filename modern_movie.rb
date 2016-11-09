require './movie.rb'
class ModernMovie < Movie
  PRICE = 3

  def long_title
    "#{self.title} — современное кино: играют #{self.main_actors * ", "}"
  end

end