class PolyTreeNode

    attr_reader :pos
    attr_accessor :children, :parent

    def initialize(pos, parent = nil)
        @pos = pos
        @children = []
        @parent = parent
        @parent.children << self if !parent.nil?
    end

    def dfs(end_pos)
        return self if self.pos == end_pos
        self.children.each do |node|
            res = node.dfs(end_pos)
            return res if res
        end
        nil
    end
end