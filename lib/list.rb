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
      "This is an empty list" 
    else 
      current_node = @head
      nodes_data_as_string = ""
      nodes_data_as_string << current_node.data

        until current_node.next_node == nil 
          current_node = current_node.next_node
          nodes_data_as_string << " " + current_node.data #could also use interpolation here
        end 
      nodes_data_as_string
    end
  end


  def prepend(data)
    #creates new note with the data passed as an argument to prepend
    new_node = Node.new(data)
    #sets the new node as having a next node of the head 
    new_node.next_node = @head
    #sets head as the new node
    @head = new_node  
  end
  
  #going to need to insert between two nodes so will have to walk the list
  #then insert a new node between two nodes once we dind the index
  #will probs use the count method
  def insert(index, data)
    new_node = Node.new(data)
    if index == 0
      #can probably use prepend or append here to refactor?
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
  def find(index, elements)
    if self.count == 0
      "This is an empty list"
    else 
      current_node = @head
      index_counter = 0
      elements_string = ""
      until index_counter >= index || current_node.next_node == nil
        current_node = current_node.next_node 
        index_counter += 1
      end
      elements_string << current_node.data
      # require 'pry';binding.pry
      until elements_string.split(" ").length == elements
        # elements_string << " #{current_node.data}"
        current_node = current_node.next_node
        elements_string << " #{current_node.data}"
        # require 'pry';binding.pry
      end
      elements_string
    end
  end
  def includes?(data)
    if self.to_string.include?(data)
      # require 'pry';binding.pry
      true
    else 
      false
    end
  end
  def pop 
    if @head == nil 
      "This is an empty list"
    else
      current_node = @head

      until current_node.next_node == nil 
        current_node = current_node.next_node
      end 
      last_node = current_node
      current_node = @head
      
      until current_node.next_node == last_node
        current_node = current_node.next_node
      end

      current_node.next_node = nil
      last_node.data
      # self.to_string.chomp(current_node.data)
      #tried using this before realizing what I really needed to do is 
      #set the second to last element.next_node to nil
      #under the hood...does this actually remove the last node? 
      #Or are we just modifying the second to last object to 
    end
  end
end