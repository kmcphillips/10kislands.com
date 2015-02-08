require 'rails_helper'

RSpec.describe Admin::CardsController, :type => :controller do
  before do
    user = double('user')
    request.env['warden'] = double
    allow(request.env['warden']).to receive(:authenticate!) { user }
    allow(controller).to receive(:current_user) { user }
  end

  let(:card){ Card.create!(description: "Dogz Party Anthem", link: "http://youtube.com/asdf") }

  describe "GET index" do
    it "assigns cards and renders" do
      expect(Card).to receive(:sorted).and_return([card])
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:cards)).to eq([card])
    end
  end

  describe "POST move_higher" do
    let!(:first_card){ Card.create!(description: "First", link: "http://youtube.com/first") }
    let!(:last_card){ Card.create!(description: "Last", link: "http://youtube.com/last") }

    it "moves the card up" do
      expect(Card.sorted).to eq([first_card, last_card])
      post :move_higher, id: last_card
      expect(response).to redirect_to(admin_cards_path)
      expect(Card.sorted).to eq([last_card, first_card])
    end

    it "does not move the card up if it is first" do
      expect(Card.sorted).to eq([first_card, last_card])
      post :move_higher, id: first_card
      expect(response).to redirect_to(admin_cards_path)
      expect(Card.sorted).to eq([first_card, last_card])
    end
  end

  describe "POST move_higher" do
    let!(:first_card){ Card.create!(description: "First", link: "http://youtube.com/first") }
    let!(:last_card){ Card.create!(description: "Last", link: "http://youtube.com/last") }

    it "moves the card down" do
      expect(Card.sorted).to eq([first_card, last_card])
      post :move_lower, id: first_card
      expect(response).to redirect_to(admin_cards_path)
      expect(Card.sorted).to eq([last_card, first_card])
    end

    it "does not move the card down if it is last" do
      expect(Card.sorted).to eq([first_card, last_card])
      post :move_lower, id: last_card
      expect(response).to redirect_to(admin_cards_path)
      expect(Card.sorted).to eq([first_card, last_card])
    end
  end

end
