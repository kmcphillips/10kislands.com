class Admin::CardsController < AdminController

  def index
    @cards = Card.sorted
  end

  private

  def card_params
    params.require(:card).permit(:description, :link)
  end
end
