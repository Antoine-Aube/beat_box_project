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
      # require 'pry';binding.pry
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

    it "will return a string if the list is empty" do 
      list = LinkedList.new

      expect(list.to_string).to eq("This is an empty list")
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
      # require 'pry';binding.pry
      expect(list.to_string).to eq("dop plop suu")
      expect(list.count).to eq(3)
    end
    
    it "has an insert method that takes two arguments: index and data" do 
      list = LinkedList.new
      list.append("plop")
      list.append("suu")
      list.prepend("dop")
      # require 'pry';binding.pry
      list.insert(1, "woo")
      # require 'pry';binding.pry
      expect(list.to_string).to eq("dop woo plop suu")
      #edge case test
      list.insert(7, "shibby")
      expect(list.insert(7, "shibby")).to eq ("List is too short to insert at that index")
    end
    
    it "has a find method that take a position argument and number of elements" do 
      list = LinkedList.new
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.to_string).to eq("deep woo shi shu blop")
      # require 'pry';binding.pry
      expect(list.find(2, 1)).to eq("shi")
      # require 'pry';binding.pry
      expect(list.find(1, 3)).to eq("woo shi shu")
      # require 'pry';binding.pry
      expect(list.find(3, 2))
    end

    it "has an includes method that returns boolean" do 
      list = LinkedList.new
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")
      # list.append("Johnny Deep")
      
      expect(list.to_string).to eq("deep woo shi shu blop")
      # require 'pry';binding.pry
      expect(list.includes?("dep")).to eq false
      expect(list.includes?("deep")).to eq true
      expect(list.includes?("shi")).to eq true 
      expect(list.includes?("Johnny Deep")).to eq false
    end

    it "has a pop method that return the last element and removes it" do 
      list = LinkedList.new
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.to_string).to eq("deep woo shi shu blop")
      expect(list.pop).to eq("blop")
      expect(list.pop).to eq("shu")
      # require 'pry';binding.pry
    end
  end 
end