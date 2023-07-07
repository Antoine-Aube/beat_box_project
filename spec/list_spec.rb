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
  end 
end