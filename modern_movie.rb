# encoding: utf-8
# frozen_string_literal: true
module Kino
  # Class ModernMovie, inherits the Movie, some special attributes and behaviour are added
  class ModernMovie < Movie
    PRICE = 3

    def long_title
      "#{title} — современное кино: играют #{main_actors * ', '}"
    end
  end
end
