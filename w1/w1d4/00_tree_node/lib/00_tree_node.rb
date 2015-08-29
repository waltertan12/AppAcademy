require 'byebug'


class PolyTreeNode
  attr_reader :value, :children, :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = node
    unless node.nil? || @parent.children.include?(self)
      @parent.children << self
    end
  end

  def add_child(node)
    node.parent = self
    children << node unless children.include?(node)
  end

  def remove_child(node)
    raise unless children.include?(node)
    children.delete(node)
    node.parent = nil
  end

  def dfs(target)
    return self if value == target
    return nil if children.empty?
    val = nil
    children.each do |child|
      val ||= child.dfs(target)
      return val unless val.nil?
    end
    val
  end

  def bfs(target)
    queue = [self]

    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target
      queue += current_node.children unless current_node.children.empty?
    end

    nil
  end

  def trace_path_back
    current = self
    result = []
    until current.nil?
      result << current.value
      current = current.parent
    end
    result.reverse
  end

end

if __FILE__ == $PROGRAM_NAME
  p1 = PolyTreeNode.new(1)
  p2 = PolyTreeNode.new(2)
  p1.add_child(p2)
  puts "p1: #{p1}, p2 #{p2}"
  puts p1.dfs(2)
end
