require 'pry'
require 'node.rb'

RSpec.describe Node do 
  describe '#intialize' do

    it "is an instance of node" do 
      node_1 = Node.new("bleep")
      expect(node_1).to be_a(Node)
    end
  end
end
 RSpec.describe Node do
    it "has a data" do
      node_1 = Node.new("plop")

      expect(node_1.data).to eq("plop")    
    end
end