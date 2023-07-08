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
          #previous_node = current_node
          #current_node = previous_node.next_node
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
      node_count = 1

        until current_node.next_node == nil 
          current_node = current_node.next_node
          node_count += 1
        end
      node_count
    end
  end

  def to_string
    # nodes_data_as_string = ""
    if @head == nil
      nil 
    else 
      current_node = @head
      nodes_data_as_string = ""
      nodes_data_as_string << current_node.data

        until current_node.next_node == nil 
          current_node = current_node.next_node
          nodes_data_as_string << " #{current_node.data}"
        end 
      nodes_data_as_string
    end
  end


  def prepend(data)
    new_node = Node.new(data)
    #sets the new node as having a next node of the head 
    new_node.next_node = @head
    #sets head as the new node
    @head = new_node  
  end
  
  #going to essentially prepend whichever node index we call 
  #will probs use the count method
  def insert(index, data)
    new_node = Node.new(data)
    if index == 0
      new_node.next_node = @head
      @head = new_node
    else
      current_node = @head
      node_count = 1
      # require 'pry';binding.pry
        #ran into a big issue with this where I was comparing the index using < rather than >. Note #to self, while using the until loop - make sure to check your logic
        until node_count >= index || current_node.next_node == nil
          current_node = current_node.next_node 
          node_count += 1
        end
      # new_node = Node.new(data)
      new_node.next_node = current_node.next_node
      current_node.next_node = new_node
    end
  end

end