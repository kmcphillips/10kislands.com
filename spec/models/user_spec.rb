require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user){ User.create!(name: "PHart", email: "phart@10kislands.com", password: "password") }

  context "validations" do
    it "should be valid" do
      expect(user).to be_valid
    end
  end

end
