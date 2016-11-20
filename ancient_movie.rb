module Kino
  require './movie.rb'
  require 'money'
  I18n.enforce_available_locales = false


  class AncientMovie < Movie
    PRICE = 1

    def long_title
      "#{self.title} — старый фильм (#{self.year} год)"
    end

  end
end

