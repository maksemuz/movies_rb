module Kino
  require './movie.rb'
  require 'money'
  I18n.enforce_available_locales = false


  class ModernMovie < Movie
    PRICE = 3

    def long_title
      "#{self.title} — современное кино: играют #{self.main_actors * ", "}"
    end

  end
end
