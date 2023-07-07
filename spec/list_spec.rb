require 'pry'
require './lib/list.rb'
require './lib/node.rb'

RSpec.describe LinkedList do 
  describe '#intialize' do
    it "exists and has a head instance variable" do 
      list = LinkedList.new

      expect(list).to be_a(LinkedList)
    end
     it "head returns nil" do 
     list = LinkedList.new
     
     expect(list.head).to eq(nil)
    end
    it "has an append method that adds a new node to end of list" do 
      list = LinkedList.new

      list.append("doop")
      # require 'pry';binding.pry
      expect(list.head.data).to eq("doop")
      expect(list.head.next_node).to eq(nil)
    end
    it "can add multiple nodes" do 
      list = LinkedList.new
      
      list.append("doop")
      # require 'pry';binding.pry
      list.append("deep")
      # require 'pry';binding.pry
      expect(list.head.next_node.data).to eq("deep")
    end 
    it "can add more than two nodes to the list" do 
      list = LinkedList.new
      
      list.append("doop")
      list.append("deep")
      list.append("dip")
      # require 'pry';binding.pry
      expect(list.head.next_node.next_node.data).to eq("dip")
    end
    it "has a counter that counts the amount of nodes in the list" do
      list = LinkedList.new
      expect(list.count).to eq(0)
      # require 'pry';binding.pry
      list.append("doop")
      list.append("deep")
      list.append("dip")
      # require 'pry';binding.pry
      expect(list.count).to eq(3)
    end
    it "has a method which return the list node data as a string" do 
      list = LinkedList.new
      # require 'pry';binding.pry
      list.append("doop")
      list.append("deep")
      list.append("dip")
      expect(list.to_string).to eq("doop deep dip")
    end
  end
  describe "iteration_2" do  
    it "has a prepend method" do 
      list = LinkedList.new
      # list.prepend("dop")
      # require 'pry';binding.pry
      # expect(list.to_string).to eq("dop")
      list.append("plop")
      list.append("suu")
      
      expect(list.to_string).to eq("plop suu")
      list.prepend("dop")
      require 'pry';binding.pry
      expect(list.to_string).to eq("dop plop suu")
    end
  end 
end