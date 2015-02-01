require 'rails_helper'

RSpec.describe PageController, :type => :controller do
  describe "GET#home" do
    it "should return and render success" do
      get :home
      expect(response).to be_success
    end
  end
end
