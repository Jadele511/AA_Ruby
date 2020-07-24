class PolyTreeNode

    attr_accessor :value, :parent, :children
    def initialize(value)
        @value = value 
        @parent = nil
        @children = []
    end

    def parent=(dad)
        if !@parent.nil?
            @parent.children.delete(self)
        end
        @parent = dad
        dad.children << self if !dad.nil?
    end

    def add_child(new_child)
        return if new_child.nil?
        prev_parent = new_child.parent
        if !prev_parent.nil?
            prev_parent.children.delete(new_child)
        end
        @children << new_child if  @children.include?(new_child)
        new_child.parent = self
    end

    def remove_child(child)
        raise if !@children.include?(child)
        @children.delete(child)
        child.parent = nil
    end

    def dfs(target_value)
        return nil if self.nil?
        return self if @value == target_value

        @children.each do |child|
            result = child.dfs(target_value)
            return result if !result.nil? 
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            node = queue.shift
            if node.value == target_value
                return node
            else
                queue += node.children 
            end
        end
        nil
    end

end