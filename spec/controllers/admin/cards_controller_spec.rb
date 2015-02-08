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

end
