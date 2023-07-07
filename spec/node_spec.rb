require 'pry'
require './lib/node.rb'

RSpec.describe Node do 
  describe '#intialize' do

    it "is an instance of node" do 
      node_1 = Node.new("bleep")
      expect(node_1).to be_a(Node)
    end

    it "has a data" do
      node_1 = Node.new("plop")

      expect(node_1.data).to eq("plop") 
    end 
    it "return next node value" do 
      node_1 = Node.new("sskat")

      expect(node_1.next_node).to eq(nil)
    end
  end 
end