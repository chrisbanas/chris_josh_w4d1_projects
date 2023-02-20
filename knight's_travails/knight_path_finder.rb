require_relative "poly_tree_node.rb"

class KnightPathFinder

    def self.valid_moves(pos)
        # put every move that's valid from position
        #return array

        # [-2, -1]
        # [-2, 1]
        # [-1, -2]
    end

    attr_reader :root_node, :considered_positions

    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        self.build_move_tree
        @considered_positions = [start_pos]
    end

    def build_move_tree
        root_node
    end

    def new_move_positions(pos)
        @considered_positions
        KnightPathFinder.valid_moves
    end














end

if $PROGRAM_NAME == __FILE__
     p a = KnightPathFinder.new([0,0])
     p a.root_node.value
     p a.considered_positions
end
