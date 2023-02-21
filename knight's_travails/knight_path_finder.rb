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

    attr_reader :root_node, :considered_positions, :start_pos

    def initialize(start_pos)
        @start_pos = start_pos
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        self.build_move_tree
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

    def build_move_tree
        # use new_move_positions
       #  queue
       # set root node to start position

       #create new node for each potential position
       #breadth first search
        # iterate through new move positions
        # turn them into nodes, add them as children
        queue = [@root_node]   # initialize queue with root node
        until queue.empty?  # loop through queue until it is empty
            current_node = queue.shift   # shift out first node from queue, set to current value
            current_position = current_node.value # store value of current node
            self.new_move_positions(current_position).each do |position| # loop through array returned by #new_move_positions method,
                next_node = PolyTreeNode.new(position) # instantiate node
                current_node.add_child(next_node)   # call #add_child methd on new instance
                queue << next_node # shovel new instance into queue
            end
        end

    end

    def trace_path_back(end_node)

        path = []

        current_node = end_node

        until current_node == nil
            path << current_node.value
            current_node = current_node.parent
        end

        path


        # loop till nill

        # look at the parent of each node and add the parent
        # add the value for each node to the find_path
        # look at the value of the end node and add that to the path.

        # check it's parent, then it's parent's parent.

        # until node.value == nil

        # self.root_node

    end


    def find_path(end_pos)

        # look for the node that has a value for the end position

        end_node = root_node.dfs(end_pos)

        self.trace_path_back(end_node).reverse

    end

end

if $PROGRAM_NAME == __FILE__
     a = KnightPathFinder.new([0,0])
    #  a.root_node.value
    #  a.considered_positions
    #  puts
    #  p KnightPathFinder.valid_moves([0,0])
    #  a.new_move_positions([0,0])
    #  a.considered_positions
     puts
     p a.find_path([7, 6])
     p a.find_path([6, 2])
    #  p a.build_move_tree



end
