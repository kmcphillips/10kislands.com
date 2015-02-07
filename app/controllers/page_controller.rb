class PageController < ApplicationController
  def home
    @cards = Card.sorted
  end
end
