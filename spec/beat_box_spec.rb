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
      # requiradde 'pry';binding.pry
      expect(beat_box.count).to eq(6)
    end 

    xit "has a method to play the sounds" do 
      beat_box = BeatBox.new
      beat_box.append("deep doo ditt")
      beat_box.append("woo hoo shu shibby shibby sling")

      expect(beat_box.count).to eq(9)
      expect(beat_box.list.count).to eq(9)
      beat_box.play
      # require 'pry';binding.pry
      # expect(beat_box.play).to eq(`say -r 100 -v Alex deep doo ditt woo hoo shu`)
      #for some reason play sound three times when I do a test for it on line 44
    end
  end
  describe "iteration 4" do 
    it "has a prepend method" do 
      beat_box = BeatBox.new

      beat_box.prepend("tee tee tee deep")
      expect(beat_box.list.to_string).to eq("tee tee tee deep")
    end

    it "has an all method that checks qualified inputs" do 
      beat_box = BeatBox.new
      beat_box.append("deep Mississippi Slagg")

      # require 'pry';binding.pry
      expect(beat_box.all).to eq("deep")

      beat_box.prepend("boop Astronaut la")
      expect(beat_box.all).to eq("boop la deep")
    end

    xit "can change rate" do 
      beat_box = BeatBox.new
      beat_box.append("shee shee shaa shaa shoo")
      # require 'pry';binding.pry
      beat_box.change_rate(50)
      beat_box.play
    end
    
    xit "can change voice" do 
      beat_box = BeatBox.new
      beat_box.append("shee shee shaa shaa shoo")

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