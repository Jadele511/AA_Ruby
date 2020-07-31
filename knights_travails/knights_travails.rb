require_relative 'polytreenode'

class KnightPathFinder

    attr_reader :start_pos
    attr_accessor :root_node, :considered_positions

    def self.valid_moves(pos)
        row, col = pos
        dx = [-2, -2, -1, 1, 2, 2, -1, 1]
        dy = [-1, 1, 2, 2, 1, -1, -2. -2]
        res = []
        (0...dx.length).each do |i|
            new_row = row + dx[i]
            new_col = col + dy[i]
            res << [ new_row, new_col] if new_row >= 0 && new_row < 8 && new_col >= 0 && new_col < 8
        end
        res
    end

    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        self.root_node.build_move_tree   
    end

    def new_move_positions(current_pos)
        remaning_positions = KnightPathFinder.valid_moves(curent_pos).reject {|pos| @considered_positions.include?(pos)}
        @considered_positions += remaning_positions
        remaning_positions
    end

    def build_move_tree
        queue = [@root_node]
        while !queue.empty?
            node = queue.shift 
            new_nodes = new_move_positions(node.pos).map {|pos| PolyTreeNode.new(pos, node)}
            queue += new_nodes
        end   
    end

    def find_path(end_pos)
        @root_node.dfs(end_pos)
    end

    def trace_path_back(end_node)
        res = []
        node = end_node
        while !node.nil?
            res << node.pos
            node = node.parent
        end
        res.reverse
    end

end 