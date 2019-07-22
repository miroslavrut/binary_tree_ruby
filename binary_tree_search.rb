class Node
  attr_accessor :value, :left, :right, :root

  def initialize(val)
    @value = val
    @left = nil
    @right = nil
  end

  def self.build_tree(ary)
    @root = Node.new(ary.shift)
    ary.each {|x| @root.insert(x) }
    @root
  end

  def insert(v)
    if v < self.value
      insert_left(v)
    elsif v >= self.value
      insert_right(v)
    end
  end

  def insert_left(v)
    left ? self.left.insert(v) : self.left = Node.new(v)
  end

  def insert_right(v)
    right ? self.right.insert(v) : self.right = Node.new(v)
  end


  def breadth_first_search(v)
    return self if self.value == v
    que = [self] 
    until que.empty?
      node = que.shift
      return node if node.value == v
      que << node.left  if node.left
      que << node.right if node.right
    end
    return nil
  end

  def depth_first_search(v)
    stack = [self]
    until stack.empty?
      node = stack.pop
      return node if node.value == v
      stack << node.left  if node.left
      stack << node.right if node.right
    end
  end

  def  rec_dfs(v, node = self)
    return if node.nil?
    return node if node.value == v
    rec_dfs(v, node.left) if node.left
    rec_dfs(v, node.right) if node.right
  end

  def inspect
    "{#{value}::#{left.inspect}|#{right.inspect}}"
  end

  def to_s
    "Value : #{self.value}"
  end

end

a = [1,2,3,4,5,6,7,8] 

tree = Node.build_tree(a)  # => {1::nil|{2::nil|{3::nil|{4::nil|{5::nil|{6::nil|{7::nil|{8::nil|nil}}}}}}}}
tree.class   # => Node
treenew = tree.breadth_first_search(2)   # => {2::nil|{3::nil|{4::nil|{5::nil|{6::nil|{7::nil|{8::nil|nil}}}}}}}

puts treenew

tree.inspect   # => "{1::nil|{2::nil|{3::nil|{4::nil|{5::nil|{6::nil|{7::nil|{8::nil|nil}}}}}}}}"

puts tree

tree.rec_dfs(4)   # => {4::nil|{5::nil|{6::nil|{7::nil|{8::nil|nil}}}}}

# >> Value : 2
# >> Value : 1