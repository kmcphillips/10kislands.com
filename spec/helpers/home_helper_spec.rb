require 'rails_helper'

RSpec.describe HomeHelper, :type => :helper do
  describe "#class_for_index" do
    it "should know the classes required for the index cards" do
      expect(helper.class_for_index(0)).to eq("big")
      expect(helper.class_for_index(1)).to eq("small")
      expect(helper.class_for_index(2)).to eq("small")
      expect(helper.class_for_index(3)).to eq("big2")
      expect(helper.class_for_index(4)).to eq("small2")
      expect(helper.class_for_index(5)).to eq("small2")
    end

    it "should extrapolate future classes that don't yet exist" do
      expect(helper.class_for_index(6)).to eq("big3")
      expect(helper.class_for_index(7)).to eq("small3")
      expect(helper.class_for_index(8)).to eq("small3")
      expect(helper.class_for_index(9)).to eq("big4")
    end
  end
end
