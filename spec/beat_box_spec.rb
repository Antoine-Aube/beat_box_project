require 'pry'
require './lib/list.rb'
require './lib/node.rb'
require './lib/beat_box.rb'

RSpec.describe BeatBox do 
  describe "iteration_3" do 
    it "BeatBox object exists" do 
      beat_box = BeatBox.new
      
      expect(beat_box).to be_a(BeatBox)
    end
    it "has an empty list with a head that equals nil" do 
      beat_box = BeatBox.new
      
      expect(beat_box.list.head).to eq(nil)
    end
    it "has an append method that can append multiple beats at once" do 
      beat_box = BeatBox.new

      beat_box.append("deep doo ditt")
      expect(beat_box.list.head.data).to eq("deep")
      #  require 'pry';binding.pry
      expect(beat_box.list.head.next_node.data).to eq("doo")
    end
    it "has a count method that counts the amount of sounds in the beat box" do 
      beat_box = BeatBox.new

      beat_box.append("deep doo ditt")
      beat_box.append("woo hoo shu")
      expect(beat_box.list.to_string).to eq("deep doo ditt woo hoo shu")
      require 'pry';binding.pry
      expect(beat_box.count).to eq(6)
    end 
  end
end