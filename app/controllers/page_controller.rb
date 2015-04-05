class PageController < PublicController
  def home
    @cards = Card.sorted
  end
end
