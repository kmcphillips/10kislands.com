require 'rails_helper'

RSpec.describe Admin::PublishController, type: :controller do
  let(:user){ double('user', id: 123) }

  before do
    request.env['warden'] = double
    allow(request.env['warden']).to receive(:authenticate!) { user }
    allow(controller).to receive(:current_user) { user }
  end

  describe "POST create" do
    it "enqueues and redirects" do
      expect{
        post :create
      }.to enqueue_a(PublishJob).with(user: user)

      expect(response).to redirect_to(admin_root_path)
      expect(flash[:notice]).to_not be_blank
    end

    it "handles an error" do
      expect(PublishJob).to receive(:perform_later).and_raise("Dang")

      post :create

      expect(response).to redirect_to(admin_root_path)
      expect(flash[:error]).to_not be_blank
    end
  end

end
