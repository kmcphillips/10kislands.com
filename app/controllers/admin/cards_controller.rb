class Admin::CardsController < AdminController
  before_action :load_card, only: [:edit, :update, :move_higher, :move_lower]

  def index
    @cards = Card.sorted
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to admin_cards_path, notice: 'Update successful.'
    else
      render :edit
    end
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
    params.require(:card).permit(:description, :link, :background)
  end
end
