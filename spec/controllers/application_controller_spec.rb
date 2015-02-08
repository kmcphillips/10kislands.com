require 'rails_helper'

RSpec.describe ApplicationController, :type => :controller do
  context "helper methods" do
    it "returns the root admin path after login" do
      expect(controller.send(:after_sign_in_path_for, double)).to eq(admin_root_path)
    end
  end
end
