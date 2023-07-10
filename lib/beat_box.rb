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

  def prepend(data)
    data_strings_array = data.split.reverse
    data_strings_array.each {|sound| @list.prepend(sound)}
  end

  def all
    accepted_inputs = ["tee", "dee", "deep", "bop", "boop", "la", "na"]
  end
  def count
    #more methods reused!
    @list.count
  end

  def play
    `say -r 100 -v Boing Voice 1 #{self.list.to_string} `
  end
end 