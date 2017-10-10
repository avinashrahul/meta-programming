require 'pry'
class LinkedList

  def initialize
    @head = nil
  end

  def append(val)
    if @head
      find_tail.next = Node.new(val)
    else
      @head = Node.new(val)
    end
  end

  def append_after(target, value)
    node = find(target)
    prev_node_next = node.next
    node.next = Node.new(value)
    node.next.next = prev_node_next
  end

  def find(value)
    node = @head
    return node if node.value == value
    while(node = node.next)
      return node if node.value == value
    end
  end

  def find_tail
    node = @head
    return node if node.next.nil?
    # return last nil node
    return node if node.next.nil? while(node = node.next)
  end

  def delete(value)
    node = find_before(value)
    node.next = node.next.next
    return node
  end

  def find_before(value)
    node = @head
    return node if node.next && node.next.value == value
    while(node = node.next)
      return node if node.next && node.next.value == value
    end
  end

  def print
    node = @head
    puts node.inspect
    # until the node is nil(which indicates last node) loop
    while(node = node.next)
      puts node.inspect
    end
  end
end

class Node
  attr_accessor :next
  attr_reader :value

  def initialize(value)
    @value = value
    @next = nil
  end
end

l = LinkedList.new
l.append(10)
l.append(20)
l.append(30)
l.append_after(10, 15)
l.append_after(20, 25)
print l.delete(15)
l.print
