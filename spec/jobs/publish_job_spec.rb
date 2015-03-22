require 'rails_helper'

RSpec.describe PublishJob, type: :job do
  let(:user){ User.create!(name: "PHart", email: "phart@10kislands.com", password: "password") }

  before do
    allow_any_instance_of(FtpUploader).to receive(:upload)
  end

  describe "#perform" do
    it "should accept a user id" do
      PublishJob.new.perform(user: user)
    end
  end
end
