require 'rails_helper'

RSpec.describe Card, :type => :model do
  context "validations" do
    let(:card){ Card.new(description: "A video\nAbout Stuff\n2015", link: "http://www.youtube.com/watch?v=abcdefghijk&sns=em") }

    it "should be valid" do
      expect(card).to be_valid
    end

    describe "#link" do
      it "should validate it is a YouTube link" do
        card.link = "http://youtube.com/watch?v=1235566"
        expect(card).to be_valid
      end

      it "should not allow other video sites" do
        card.link = "http://vimeo.com/fancy"
        expect(card).to_not be_valid
      end
    end
  end
end
