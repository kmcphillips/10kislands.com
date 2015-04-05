class PageRenderer
  def home
    ApplicationController.new.render_to_string(
      template: 'page/home',
      layout: 'application',
      locals: { :@cards => cards }
    )
  end

  def home_assets
    cards.map do |card|
      card.background
    end
  end

  private

  def cards
    @cards ||= Card.sorted
  end
end
