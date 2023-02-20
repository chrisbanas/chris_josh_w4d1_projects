require_relative "poly_tree_node.rb"

class KnightPathFinder

    def self.valid_moves(pos)
        # put every move that's valid from position
        #return array

        # // All possible moves of a knight
        # int X[8] = { 2, 1, -1, -2, -2, -1, 1, 2 }
        # int Y[8] = { 1, 2, 2, 1, -1, -2, -2, -1 }

        #can't be less than zero or greater than 7

        # [4, 5] + [2, 1] > [6, 6]

        valid_pos = [[2, 1], [1, 2], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]
        valid_move = []

        valid_pos.each do |sub_arr|
            if (pos[0] + sub_arr[0] >= 0 && pos[0] + sub_arr[0] <= 7) && (pos[1] + sub_arr[1] >= 0 && pos[1] + sub_arr[1] <= 7)
                valid_move << [(pos[0] + sub_arr[0]), pos[1] + sub_arr[1]]
            end
        end

        valid_move

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

        # take in the pos to valid moves and return the array of all valid moves based on that pos
        # scan cosidered_positions with these valid moves and add the ones to considered that were not there.
        # return only the valid moves that were not in considered positions

        valid = KnightPathFinder.valid_moves(pos)
        new_moves = valid.select { |sub_pos| !@considered_positions.include?(sub_pos) }
        @considered_positions.concat(new_moves)
        new_moves
    end














end

if $PROGRAM_NAME == __FILE__
     p a = KnightPathFinder.new([4,0])
     p a.root_node.value
     p a.considered_positions
     p KnightPathFinder.valid_moves([4,0])
     p a.new_move_positions([4,0])
     p a.considered_positions
     p KnightPathFinder.valid_moves([4,0])
     p a.new_move_positions([4,0])
     p a.considered_positions
end
