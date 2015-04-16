require 'rails_helper'

RSpec.describe Card, :type => :model do
  let(:card){ Card.new(description: "A video\nAbout Stuff\n2015", link: "http://www.youtube.com/watch?v=abcdefghijk&sns=em") }

  context "validations" do
    it "should be valid" do
      expect(card).to be_valid
    end

    describe "#link" do
      it "should validate it is a YouTube link" do
        card.link = "http://youtube.com/watch?v=1235566"
        expect(card).to be_valid
      end

      it "should validate it is a YouTube link including short domain" do
        card.link = "http://youtu.be/123152asdf"
        expect(card).to be_valid
      end

      it "should allow Vimeo link" do
        card.link = "http://vimeo.com/12345"
        expect(card).to be_valid
      end

      it "should not allow other video sites" do
        card.link = "http://myvideo.com/1234"
        expect(card).to_not be_valid
      end
    end
  end

  describe "#title" do
    it "should be a simplified version of description" do
      expect(card.title).to eq("A video About Stuff 2015")
    end
  end
end
