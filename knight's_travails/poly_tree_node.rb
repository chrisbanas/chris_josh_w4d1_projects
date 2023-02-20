class PolyTreeNode

    attr_reader :value, :parent, :children, :dfs

    def initialize(value, children = [])
        @value = value
        @parent = nil
        @children = children
    end

    def parent=(new_node)
        # remove self from parent's children
        if parent
            self.parent.children.delete(self)
        end

        @parent = new_node
        # add self to new parent's children
        if parent
            self.parent.children << self
        end
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        if self.children.include?(child) == false
            raise
        else
            child.parent = nil
        end
    end

    def dfs(target_value)
        return self if self.value == target_value

        self.children.each do |child|
            search = child.dfs(target_value)
            return search unless search.nil?
        end

        nil

    end


    def bfs(target_value)
        # return self if self.value == target_value

        queue = [self]

        until queue.empty?
            # debugger
            node = queue.shift
            return node if node.value == target_value
            queue.concat(node.children) unless node.nil?
        end

        nil


    end

end
