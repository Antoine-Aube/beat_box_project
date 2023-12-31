require_relative 'node.rb'
require_relative 'list.rb'

class BeatBox
  attr_reader :list
  
  def initialize(beat = nil)
    @list = LinkedList.new
    @rate = 500 
    @voice = "Boing" 
    append(beat) if beat != nil 
  end

  def append(data)
    data_strings_array = data.split
    data_strings_array.each {|sound| @list.append(sound)}
  end

  def prepend(data)
    data_strings_array = data.split.reverse
    data_strings_array.each {|sound| @list.prepend(sound)}
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