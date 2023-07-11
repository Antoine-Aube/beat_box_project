require_relative 'node.rb'

class LinkedList
  attr_reader :head
  def initialize
    @head = nil 
  end

  def append(data)
    if validate_input(data) == false 
      return 
    end
    new_node = Node.new(data)
    if @head == nil 
      @head = new_node
    else
      current_node = @head
 
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
      node_count = 1

        until current_node.next_node == nil 
          current_node = current_node.next_node
          node_count += 1
        end
      node_count
    end
  end

  def to_string
    if @head == nil
      "This is an empty list" 
    else 
      current_node = @head
      nodes_data_as_string = ""
      nodes_data_as_string << current_node.data

        until current_node.next_node == nil 
          current_node = current_node.next_node
          nodes_data_as_string << " " + current_node.data
        end 
      nodes_data_as_string
    end
  end

  def prepend(data)
    if validate_input(data) == false 
      return 
    end
    
    new_node = Node.new(data) 
    new_node.next_node = @head  
    @head = new_node  
  end
  
  def insert(index, data)
    new_node = Node.new(data)
    if count < index
      "List is too short to insert at that index"
    elsif index == 0
      new_node.next_node = @head
      @head = new_node
    else
      current_node = @head
      node_count = 1

        until node_count >= index || current_node.next_node == nil
          current_node = current_node.next_node 
          node_count += 1
        end
      new_node.next_node = current_node.next_node
      current_node.next_node = new_node
    end
  end

  def find(index, elements)
    if count == 0
      "This is an empty list"
    elsif count < index
      "The list is shorter than the position you are searching for"
    else 
      current_node = @head
      index_counter = 0
      elements_string = ""
      until index_counter >= index || current_node.next_node == nil
        current_node = current_node.next_node 
        index_counter += 1
      end
      elements_string << current_node.data
    
      until elements_string.split(" ").length == elements
        current_node = current_node.next_node
        elements_string << " #{current_node.data}"
      end
      elements_string
    end
  end

  def includes?(data)
    # alternate method but might not be kosher for this project because doesn't loop
    # self.to_string.include?(data)
    current_node = @head
      until  current_node.data == data || current_node.next_node == nil
        current_node = current_node.next_node
      end
      current_node

      if current_node.data == data
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
    end
  end
  
  def validate_input(data)
    valid_sounds = ["tee", "dee", "deep", "bop", "boop", "la", "na", "woo", "shi", "shu", "blop", "suu", "plop", "dop", "dip", "doop", "doo", "ditt", "hoo", "shibby", "sling", "shee", "shaa", "shoo"]

    valid_sounds.any? do |sound|
      if sound == data
        true
      else
        false 
      end
    end
  end
end