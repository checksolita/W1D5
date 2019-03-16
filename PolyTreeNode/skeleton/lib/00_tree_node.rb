class PolyTreeNode
  attr_reader :parent, :value
  attr_accessor :children
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end  

  def parent=(node)
    #if object's parent exists then 
    #delete from parent's children
    if !parent.nil?
      parent.children.delete(self)
    end

    @parent = node
    
    if !node.nil? 
      node.children << self
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    if !children.include?(child_node)
      raise "This is not a child of this node!"
    end
    child_node.parent = nil
  end

  def dfs(target)
    return self if value == target
    return nil if children.empty?

    children.each do |child|
      search = child.dfs(target)
      return search if !search.nil?
    end
    nil
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty?
      current_node = queue.shift
      return current_node if current_node.value == target_value
      queue += current_node.children
    end
    nil
  end
end