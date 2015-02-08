class Admin::CardsController < AdminController
  before_action :load_card, only: [:move_higher, :move_lower]

  def index
    @cards = Card.sorted
  end

  def move_higher
    @card.move_higher unless @card.first?
    redirect_to admin_cards_path
  end

  def move_lower
    @card.move_lower unless @card.last?
    redirect_to admin_cards_path
  end

  private

  def load_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:description, :link)
  end
end
