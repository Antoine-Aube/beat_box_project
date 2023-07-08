require_relative 'node.rb'
require_relative 'list.rb'

class BeatBox
  attr_reader :list
  def initialize
    @list = LinkedList.new
  end
  def append(data)
    data_strings_array = data.split
    #yay we get to reuse the append method from list class that was 
    #a pain in the ass to build!
    data_strings_array.each {|sound| @list.append(sound)}
  end
  def count
    #more methods reused!
    @list.count
  end

end