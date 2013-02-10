class Tree 
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = children
    if name.is_a?(Hash)
      @node_name = name.keys[0]
      children_hash = name[@node_name]
      children_hash.each do | k,v |
        @children << Tree.new( k => v )
      end
    else 
      @node_name = name
    end
  end

  def visit_all(&block)
    visit &block
    @children.each { |c| c.visit_all &block }
  end

  def visit(&block)
    block.call self
  end

end

# tree = Tree.new('top', [Tree.new('left',[]), Tree.new('right',[])])
#tree.visit_all { |n| puts n.node_name }ß