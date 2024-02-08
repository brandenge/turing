require './lib/node'

class LinkedList
  attr_accessor :head

  def initalize
    @head = nil
  end

  def append(data)
    node = Node.new(data)
    if @head == nil
      @head = node
      return data
    end
    current = @head
    while current.next_node != nil
      current = current.next_node
    end
    current.next_node = node
    data
  end

  def count
    count = 0
    current = @head
    while current != nil
      current = current.next_node
      count += 1
    end
    count
  end

  def to_string
    if @head == nil
      return ''
    end
    string = @head.data.to_s
    current = @head.next_node
    while current != nil
      string += " #{current.data}"
      current = current.next_node
    end
    string
  end

  def prepend(data)
    node = Node.new(data)
    node.next_node = @head if @head != nil
    @head = node
    data
  end

  def insert(index, data)
    if index == 0
      prepend(data)
      return
    end
    current = @head
    (index - 1).times do
      current = current.next_node
    end
    node = Node.new(data)
    node.next_node = current.next_node
    current.next_node = node
  end

  def find(index, count)
    return if index < 0 || count <= 0
    current = @head
    index.times do
      current = current.next_node
    end
    found = current.data.to_s
    (count - 1).times do
      current = current.next_node
      found += " #{current.data.to_s}"
    end
    found
  end

  def includes?(data)
    included = false
    current = @head
    while current != nil
      if current.data == data
        included = true
        break
      end
      current = current.next_node
    end
    included
  end

  def pop
    current = @head
    @head = nil if @head&.next_node == nil
    popped_node = nil
    while current&.next_node&.next_node != nil
      current = current.next_node
    end
    popped_node = current&.next_node
    current&.next_node = nil
    popped_node
  end
end
