require_relative 'node.rb'
require_relative 'list.rb'

class BeatBox
  attr_reader :list
  def initialize(beat = nil)
    #passing a default value makes it so that you don't need to 
    #pass anything when instantiating an object
    @list = LinkedList.new
    @rate = 500 
    @voice = "Boing"
    if beat != nil 
      prepend(beat)
    end
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
    # @list.to_string
    #this does not mutate the actual list but return the array at the end so doesn't
    #actually do what I want it to - working on a helper method within the list class
    #that will actually do this. 
    valid_inputs = ["tee", "dee", "deep", "bop", "boop", "la", "na"]
    list_to_check = @list.to_string.split
    accepted_list = []
    list_to_check.each { |sound| accepted_list << sound if valid_inputs.include?(sound) }
    accepted_list.join(" ")
  end

  def count
    #more methods reused!
    @list.count
  end

  def change_rate(new_rate)
    @rate = new_rate
  end

  def change_voice(new_voice)
    @voice = new_voice
  end

  def reset_voice
    @voice = "Boing"
  end

  def reset_rate
    @rate = 500 
  end

  def play
    `say -r #{@rate} -v #{@voice} #{self.list.to_string} `
  end
end 