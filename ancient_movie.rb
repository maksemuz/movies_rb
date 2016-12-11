# encoding: utf-8
# frozen_string_literal: true
# part of module Kino
module Kino
  # AncientMovie class
  class AncientMovie < Movie
    PRICE = 1

    def long_title
      "#{title} — старый фильм (#{year} год)"
    end
  end
end
