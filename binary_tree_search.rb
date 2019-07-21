class Node
  
  attr_reader :value
  attr_accessor :left, :right

  def initialize(v)
    @value = v
  end

  def insert(v)
    case value <=> v
    when 1 then insert_left(v) # ~> NoMethodError: undefined method `insert' for nil:NilClass
    when -1 then insert_right(v)
    when 0 then false # already present
    end
  end

  def inspect
    "{#{value}::#{left.inspect}|#{right.inspect}}"
  end

  private

  def insert_left(v)
    if left
      left.insert(v)
    else
      self.left = Node.new(v)
    end
  end

  def insert_right(v)
    if right
      right.insert(v)
    else
      self.right = Node.new(v)
    end
  end

end


tree = Node.new(10)    # => {10::nil|nil}
tree.left = Node.new(5)
tree.right = Node.new(15)

p tree


tree.insert(3) 

# >> {10::{5::nil|nil}|{15::nil|nil}}

# ~> NoMethodError
# ~> undefined method `insert' for nil:NilClass
# ~>
# ~> binary_tree_search.rb:12:in `insert'
# ~> binary_tree_search.rb:12:in `insert'
# ~> binary_tree_search.rb:50:in `<main>'