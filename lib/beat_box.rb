require_relative 'node.rb'
require_relative 'list.rb'

class BeatBox
  attr_reader :list
  def initialize
    @list = LinkedList.new
    @rate = 500 
    @voice = "Boing"
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
    valid_inputs = ["tee", "dee", "deep", "bop", "boop", "la", "na"]
    list_to_check = @list.to_string.split
    accepted_list = []
    # list_to_check.each do |sound|
    #   if valid_inputs.include?(sound)
    #     accepted_list << sound
    #   end 
    # end
    #refactored version
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

  def play
    `say -r #{@rate} -v #{@voice} Voice 1 #{self.list.to_string} `
  end
end 