require 'rails_helper'

RSpec.describe PageController, :type => :controller do
  describe "GET#home" do
    let(:cards){ [double] }
    it "should return and render success" do
      get :home
      expect(response).to be_success
    end

    it "should return the cards in order" do
      expect(Card).to receive(:sorted).and_return(cards)
      get :home
      expect(assigns[:cards]).to eq(cards)
    end
  end
end
