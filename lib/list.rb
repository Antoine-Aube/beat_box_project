require_relative 'node.rb'

class LinkedList
  attr_reader :head
  def initialize
    @head = nil 
  end

  def append(data)
    if @head.nil? 
      @head = Node.new(data)
    else
      current_node = @head

      until current_node.next_node == nil 
        current_node = current_node.next_node
      end

      current_node.next_node = Node.new(data)
    end
  end
end