require 'pry'

class Node 
  attr_reader :data
  attr_accessor :next_node
  def initialize(data)
    @data = data
    @next_node = nil
  end

  # def set_next_node(data)
  #   @next_node = data
  # end
end

