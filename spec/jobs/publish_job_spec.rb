require 'rails_helper'

RSpec.describe PublishJob, type: :job do
  let(:user){ User.create!(name: "PHart", email: "phart@10kislands.com", password: "password") }

  describe "#perform" do
    it "should accept a user id" do
      PublishJob.new.perform(user_id: user.id)
    end
  end
end
