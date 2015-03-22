class PageRenderer
  def home
    ApplicationController.new.render_to_string(
      template: 'page/home',
      layout: 'application',
      locals: { :@cards => cards }
    )
  end

  private

  def cards
    @cards ||= Card.sorted
  end
end
