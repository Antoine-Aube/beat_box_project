require 'pry'
require './lib/list.rb'
require './lib/node.rb'
require './lib/beat_box.rb'

RSpec.describe BeatBox do 
  describe "iteration 3" do 
    it "BeatBox object exists" do 
      beat_box = BeatBox.new
      
      expect(beat_box).to be_a(BeatBox)
    end
    it "has an empty list with a head that equals nil" do 
      beat_box = BeatBox.new
      
      expect(beat_box.list.head).to eq(nil)
    end
  end
end