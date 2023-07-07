require_relative 'node.rb'

class LinkedList
  attr_reader :head
  def initialize
    @head = nil 
  end

  def append(data)
    new_node = Node.new(data)
    if @head.nil? 
      @head = new_node
    else
      #if the head is not nil, we create a variable that set the head(which has a node in it) to be the "current node"
      current_node = @head

      #we need to walk through th e list, so a loop that has the condition of until the current nodes -> next node == nil
      # in this loop, while the current nodes next node DOES NOT equal NIL
      # we will set the current node = 
        until current_node.next_node == nil 
          current_node = current_node.next_node
        end

      current_node.next_node = new_node
    end
  end
  def count
    if @head == nil 
      0
    else
      current_node = @head
      node_counter = 1

        until current_node.next_node == nil 
          current_node = current_node.next_node
          node_counter += 1
        end
      node_counter
    end
  end
end