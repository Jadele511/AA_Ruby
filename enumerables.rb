class Array

    def my_each(&prc)
        self.length.times do |i|
            prc.call(self[i])
        end
        self
    end

    # return_value = [1, 2, 3].my_each do |num|
    #     puts num
    #   end.my_each do |num|
    #     puts num
    #   end
    #   # => 1
    #     #    2
    #     #    3
    #     #    1
    #     #    2
    #     #    3
      
    #   p return_value  # => [1, 2, 3]

    def my_select(&prc)
        res = []
        self.my_each do |num| 
            res << num if prc.call(num)
        end
        res
    end


    # a = [1, 2, 3]
    # p a.my_select { |num| num > 1 } # => [2, 3]
    # p a.my_select { |num| num == 4 } # => []


    def my_reject(&prc)
        res = []
        self.my_each {|num| res << num if !prc.call(num)}
        res
    end

    # a = [1, 2, 3]
    # p a.my_reject { |num| num > 1 } # => [1]
    # p a.my_reject { |num| num == 4 } # => [1, 2, 3]


    def my_any?(&prc)
        self.my_each {|num| return true if prc.call(num)}
        false
    end

    def my_all?(&prc)
        self.my_each {|num| return false if !prc.call(num)}
        true
    end

    # a = [1, 2, 3]
    # p a.my_any? { |num| num > 1 } # => true
    # p a.my_any? { |num| num == 4 } # => false
    # p a.my_all? { |num| num > 1 } # => false
    # p a.my_all? { |num| num < 4 } # => true

    def my_flatten
        res = []
        self.each do |ele|
            ele.is_a?(Array) ? res += ele.my_flatten : res << ele
        end
        res 
    end

    # p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


    def my_zip(*arrays)
        res = []
        (0...self.length).each do |i|
            sub_arr = [self[i]]
            arrays.each {|arr| sub_arr << arr[i]}
            res << sub_arr 
        end
        res 
    end


    # a = [ 4, 5, 6 ]
    # b = [ 7, 8, 9 ]
    # p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
    # p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
    # p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

    # c = [10, 11, 12]
    # d = [13, 14, 15]
    # p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


    def my_rotate(key = 1)
        res = []
        self.each_index do |i|
            new_idx = (i + key) % self.length
            res << self[new_idx]
        end
        res
    end

    # a = [ "a", "b", "c", "d" ]
    # p a.my_rotate         #=> ["b", "c", "d", "a"]
    # p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
    # p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
    # p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

    def my_join(join = '')
        res = ''
        self.each_index do |i|
            res += self[i] 
            res += join if i != self.length - 1
        end
        res
    end
    # a = [ "a", "b", "c", "d" ]
    # p a.my_join         # => "abcd"
    # p a.my_join("$")    # => "a$b$c$d"


    def my_reverse
        return self if self.length == 1 || self.empty?
        [self[-1]] + self[0..-2].my_reverse
    end

    # p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
    # p [ 1 ].my_reverse               #=> [1]

    def factors(num)
        self.select {|ele| num % ele == 0}
    end

    def bubble_sort!(&prc)
        prc = Proc.new {|a,b| a <=> b}
        sorted = false
        while !sorted
            sorted = true
            (0...self.length-1).each do |i|
                if prc.call(self[i], self[i+1]) == 1
                    self[i], self[i+1] = self[i+1], self[i]
                    sorted = false
                end
            end
        end
        self
    end


    def bubble_sort(&prc)
        res = self.dup
        prc = Proc.new {|a,b| a <=> b}
        sorted = false
        while !sorted
            sorted = true
            (0...res.length-1).each do |i|
                if prc.call(res[i], res[i+1]) == 1
                    res[i], res[i+1] = res[i+1], res[i]
                    sorted = false
                end
            end
        end
        res
    end

    p [9,3,2].bubble_sort

end

def substrings(string)
    res = []
    len = string.length
    (0...len).each do |i|
        (i...len).each do |j|
            res << string[i..j]
        end
    end

    res
end

# p substrings('cat')

def subwords(word, dictionary)
    dictionary.select {|dic| word.include?(dic)}
end

# p subwords("erbearsweatmyajs", ["bears", "ear", "a", "army"])

