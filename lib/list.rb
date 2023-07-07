require_relative 'node.rb'

class LinkedList
  attr_reader :head
  def initialize
    @head = nil 
  end

  def append(data)
    if @head.nil? 
      @head = Node.new(data)
    end
  end
end