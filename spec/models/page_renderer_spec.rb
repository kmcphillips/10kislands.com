require 'rails_helper'

RSpec.describe PageRenderer do
  let(:renderer){ PageRenderer.new }
  let!(:card){ Card.create!(description: "The Description", link: "http://www.youtube.com/watch?v=12345") }

  describe "#home" do
    it "should render out the home with cards" do
      html = renderer.home
      expect(html).to match("The Description")
      expect(html).to match("v=12345")
      expect(html).to match("<html")
      expect(html).to match("</body>")
      expect(html).to match("</html>")
    end
  end
end
