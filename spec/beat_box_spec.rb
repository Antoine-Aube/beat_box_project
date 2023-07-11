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
      expect(beat_box.list.head.next_node.data).to eq("doo")
    end

    it "has a count method that counts the amount of sounds in the beat box" do 
      beat_box = BeatBox.new
      beat_box.append("deep doo ditt")
      beat_box.append("woo hoo shu")

      expect(beat_box.list.to_string).to eq("deep doo ditt woo hoo shu")
      expect(beat_box.count).to eq(6)
    end 

    it "has a method to play the sounds" do 
      beat_box = BeatBox.new
      beat_box.append("deep doo ditt")
      beat_box.append("woo hoo shu shibby shibby sling")

      expect(beat_box.count).to eq(9)
      expect(beat_box.list.count).to eq(9)
      beat_box.play
    end
  end

  describe "iteration 4" do 
    it "can be passed a beat in the object argument" do 
      beat_box = BeatBox.new("deep")
  
      expect(beat_box.list.to_string).to eq("deep")
    end 

    it "has a prepend method" do 
      beat_box = BeatBox.new

      beat_box.prepend("tee tee tee deep")
      expect(beat_box.list.to_string).to eq("tee tee tee deep")
    end

    it "has an all method that checks qualified inputs" do 
      beat_box = BeatBox.new
      beat_box.append("deep Mississippi Slagg")

      expect(beat_box.all).to eq("deep")
      beat_box.prepend("boop Astronaut la")
      expect(beat_box.all).to eq("boop la deep")
      beat_box.play
    end

    it "can change rate" do 
      beat_box = BeatBox.new
      beat_box.append("shee shee shaa shaa shoo")
      #I defined a method in the class in order to not use an attr_accessor
      #as a small challenge so this doesn't follow interaction pattern exactly
      beat_box.change_rate(50)
      beat_box.play
    end
    
    it "can change voice" do 
      beat_box = BeatBox.new
      beat_box.append("shee shee shaa shaa shoo")
      #I defined a method in the class in order to not use an attr_accessor
      #as a small challenge so this doesn't follow interaction pattern exactly
      beat_box.change_voice("Ralph")
      beat_box.play
      beat_box.change_rate(100)
      beat_box.play
    end

    it "can reset the voice to default and rate" do 
      beat_box = BeatBox.new
      beat_box.append("shee shee shaa shaa shoo")
      beat_box.change_voice("Ralph")
      beat_box.play
      beat_box.change_rate(100)
      beat_box.play
      beat_box.reset_voice
      beat_box.play
      beat_box.reset_rate
      beat_box.play
    end
  end
end