class Stack
    attr_accessor :stack
    def initialize
      # create ivar to store stack here!
      @stack = []
    end

    def push(el)
      # adds an element to the stack
      @stack.push(el)
    
    end

    def pop
      # removes one element from the stack
      @stack.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @stack.last
    end
end

# s = Stack.new
# p s.push(6)
# p s.pop
# p s.peek

class Queue
    attr_accessor :queue
    def initialize
        # create ivar to store queue here!
        @queue= []
    end

    def enqueue(el)
        @queue.push(el)
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue.first
    end
end

# q = Queue.new
# p q.enqueue(2)
# p q.enqueue(3)
# p q.enqueue(4)
# p q.dequeue
# p q.dequeue
# p q.peek

class Map
    attr_accessor :map
    def initialize
        @map = []
    end

    def set(key, value)
        @map.each do |pair|
            if pair[0] == key 
                pair[1] = value
                return @map
            end     
        end
        @map << [key,value]
    end

    def get(key)
        res = @map.detect {|pair| pair[0] == key}
        res && res[1]
    end

    def delete(key)
        @map.reject! {|pair| pair[0] == key}
    end

    def show
        p @map
    end
end

# m = Map.new
# p m.set('a', 0)
# p m.set('b', 1)
# p m.set('a', 2)
# p m.get('b')
# p m.delete('a')
# m.show

