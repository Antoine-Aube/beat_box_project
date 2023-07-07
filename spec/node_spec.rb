require 'pry'
require 'node.rb'

RSpec.describe Node do 
  describe '#intialize' do

    it "is an instance of node" do 
      node_1 = Node.new
      expect(node_1).to be_a(Node)
    end
  end 
end