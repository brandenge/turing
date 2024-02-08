require './lib/linked_list'

class JungleBeat
  BEATS = %w(boop bop dee deep ditt doo doop dop hoo la na plop shi shu suu tee woo).freeze

  DEFAULTS = {
    rate: 500,
    voice: 'Boing'
  }.freeze

  attr_reader :list
  attr_accessor :rate, :voice

  def initialize(beats = nil)
    @list = LinkedList.new
    append(beats) if beats
    @rate = DEFAULTS[:rate]
    @voice = DEFAULTS[:voice]
  end

  def append(string_data)
    data_array = string_data.split
    data_array = data_array.filter{ |data| BEATS.include?(data) }
    data_array.each{ |data| @list.append(data) }
    data_array.count
  end

  def count
    count = 0
    current = @list.head
    while current != nil
      current = current.next_node
      count += 1
    end
    count
  end

  def play
    command = "say -r #{@rate} -v #{@voice}"
    beats = @list.to_string
    `#{command} #{beats}`
    count
  end

  def all
    @list.to_string
  end

  def prepend(string_data)
    data_array = string_data.split
    data_array = data_array.filter{ |data| BEATS.include?(data) }.reverse
    data_array.each{ |data| @list.prepend(data) }
    data_array.count
  end

  def reset_rate
    @rate = DEFAULTS[:rate]
  end

  def reset_voice
    @voice = DEFAULTS[:voice]
  end
end
