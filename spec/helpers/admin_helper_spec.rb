require 'rails_helper'

RSpec.describe AdminHelper, :type => :helper do
  let(:card){ Card.new(description: "Video\nStuff", link: "http://www.youtube.com/watch?v=asdf") }

  describe "#card_image_preview" do
    it "renders an image tag for the card with opts" do
      expected = "<img alt=\"Video Stuff\" style=\"width: 200px; height: 200px; margin: 10px;\" class=\"shiny\" src=\"/images/thumb/missing.png\" />"
      expect(helper.card_image_preview(card, class: "shiny")).to eq(expected)
    end
  end
end
