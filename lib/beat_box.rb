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
    append(beat) if beat != nil 
  end

  def append(data)
    #add a conditional inside the do block with an instance varibale that had approved sounds
    data_strings_array = data.split
    data_strings_array.each {|sound| @list.append(sound)}

    # data_strings_array.each do |sound|
    #   if @valid_inputs.include?(sound)
    #     @list.append(sound)
    #   end
    # end
  end

  def prepend(data)
    #gotta do reverse_each for the do bloc when you refactor for all method
    data_strings_array = data.split.reverse
    data_strings_array.each {|sound| @list.prepend(sound)}
  #   data.split.reverse_each do |sound|
  #     if @valid_inputs.include?(sound)
  #       @list.prepend(sound)
  #     end
  #   end
  end

  def all
    @list.to_string
  end

  def count
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
    `say -r #{@rate} -v #{@voice} #{@list.to_string} `
  end
end 