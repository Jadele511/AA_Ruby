def sum_to(n)
    return nil if n < 0
    return 1 if n == 1
    n + sum_to(n-1)
end

# Test Cases
# p sum_to(5)  # => returns 15
# p sum_to(1)  # => returns 1
# p sum_to(9)  # => returns 45
# p sum_to(-8)  # => returns nil


def add_numbers(array)
    return array.first if array.length <= 1
    array.first + add_numbers(array[1..-1])
end
# Test Cases
# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers([]) # => returns nil

def gamma_fnc(n)
    return nil if n == 0
    return 1 if n == 1 
    (n-1) * gamma_fnc(n-1)
end

# Function is defined Γ(n) = (n-1)!
# Test Cases
# p gamma_fnc(0)  # => returns nil
# p gamma_fnc(1)  # => returns 1
# p gamma_fnc(4)  # => returns 6
# p gamma_fnc(8)  # => returns 5040

def ice_cream_shop(flavors, favorite)
    return false if flavors.empty?
    return true if flavors.first == favorite
    ice_cream_shop(flavors[1..-1], favorite)
end

# Test Cases
# p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# p ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(str)
    return str if str.length <= 1
    str[-1] + reverse(str[0..-2])
end

# Test Cases
# p reverse("house") # => "esuoh"
# p reverse("dog") # => "god"
# p reverse("atom") # => "mota"
# p reverse("q") # => "q"
# p reverse("id") # => "di"
# p reverse("") # => ""




# Warmup
# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.
# Write both a recursive and iterative version of sum of an array.

def range(min, max)
    return [min] if min == max
    [min] + range(min+1, max)
end

# p range(1,6)

# Exponentiation
# Write two versions of exponent that use two different recursions:

# # this is math, not Ruby methods.

def exp_1(b,n)
    return 1 if n == 0
    b * exp(b, n - 1)
end

def exp_2(b,n)
    return 1 if n == 0
    if n.even?
        exp_2(b, n / 2) * exp_2(b, n / 2) 
    else
        b * (exp_2(b, (n - 1) / 2) * exp_2(b, (n - 1) / 2))
    end
end

# p exp_2(2,2)
# p exp_2(4,2)

# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
# Note that for recursion 2, you will need to square the results of exp(b, n / 2) and (exp(b, (n - 1) / 2). Remember that you don't need to do anything special to square a number, just calculate the value and multiply it by itself. So don't cheat and use exponentiation in your solution.

# Suggestion: Break the methods down into parts..

# Suggestion 2: Try walking through your code with Simple Examples.

# If the n == 256, about how many nested recursive steps will we run in the first case?

# How deep will we need to recurse for the second? Keep in mind that the first reduces the exponent by one for each recursion, while the second reduces it by half.

# In addition to testing your methods by running the code, try the following exercise:

# On paper, write out the value of each variable for every line in the code:

# Write out what happens with base 0 and power 0 as inputs (should be easy). e.g., if you had run exp(0,0).
# Write out what happens for base 0 and power 1. e.g., if you had run exp(0,1).
# Write out what happens for base 1 and power 0.
# Write out what happens for base 1 and power 1.
# Write out what happens for base 1 and power 2.
# Write out what happens for base 2 and power 0.
# Write out what happens for base 2 and power 4 = exp(b, )
# Write out what happens for base 2 and power 3. = 2 * 2**2
# Make sure you can trace from the very beginning to the very end in these examples.

# How many examples do you need to walk through to be confident that it works?

# Deep dup
# The #dup method doesn't make a deep copy:

class Array
    def deep_dup
        return [] if self.empty?
        return [self.first] if self.length == 1 && !(self.first.is_a?(Array))
        res = []
        self.each do |ele|
            if ele.is_a?(Array)
                res << ele.deep_dup
            else
                res << ele
            end
        end
        res
    end
end

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.deep_dup
# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# # p robot_parts[1] # => ["capacitors", "resistors", "inductors"]
# p robot_parts
# p robot_parts_copy

# a = [1, [2], [3, [4]]]
# b = a.deep_dup
# b[1] << 6
# p a
# p b
# # When we dup an Array, it creates a new array to hold the elements, but doesn't recursively dup any arrays contained therein. So the dup method creates one new array, but just copies over references to the original interior arrays.

# Sometimes you want a shallow dup and sometimes you want a deep dup. Ruby keeps things simple by giving you shallow dup, and letting you write deep dup yourself.

# Using recursion and the is_a? method, write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.

# Note: For simplicity's sake, we are only going to ensure the deep duplication of arrays. Don't worry about deep-duping (or regular-duping) other types of mutable objects (like strings, hashes, instances of custom classes, etc.), since this would require that we implement a deep dup method for each of those classes, as well.

# It's okay to iterate over array elements using the normal each for this one :-)

# You should be able to handle "mixed" arrays. For instance: [1, [2], [3, [4]]].

# Fibonacci
# Write a recursive and an iterative Fibonacci method. The method should take in an integer n and return the first n Fibonacci numbers in an array.

# You shouldn't have to pass any arrays between methods; you should be able to do this just passing a single argument for the number of Fibonacci numbers requested.

def fib(n)
    return [1] if n == 1
    return [1,1] if n == 2
    seq = fib(n-1)
    seq << seq[-1] + seq[-2]
    seq
end

# p fib(1) # [1]
# p fib(4) # [1, 1, 2, 3]
# p fib(6) # [1, 1, 2, 3, 5, 8]

# Binary Search
# The binary search algorithm begins by comparing the target value to the value of the middle element of the sorted array. If the target value is equal to the middle element's value, then the position is returned and the search is finished. If the target value is less than the middle element's value, then the search continues on the lower half of the array; or if the target value is greater than the middle element's value, then the search continues on the upper half of the array. This process continues, eliminating half of the elements, and comparing the target value to the value of the middle element of the remaining elements - until the target value is either found (and its associated element position is returned), or until the entire array has been searched (and "not found" is returned).

# Write a recursive binary search: bsearch(array, target). Note that binary search only works on sorted arrays. Make sure to return the location of the found object (or nil if not found!). Hint: you will probably want to use subarrays.

# Make sure that these test cases are working:

def bsearch(array, target)
    return nil if array.empty?
    mid = array.length / 2
    return mid if target == array[mid]
    if target > array[mid]
        res = bsearch(array[mid+1..-1], target)
        return mid + 1 + res if res
    else
        return bsearch(array[0...mid], target) 
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


# Merge Sort
# Implement a method merge_sort that sorts an Array:

# The base cases are for arrays of length zero or one. Do not use a length-two array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.
# To get a visual idea of how merge sort works, watch this gif and check out this diagram.

def merge_sort(array)
    return array if array.length <= 1
    mid = 0
    if array.length.even?
        mid = array.length / 2 - 1
    else 
        mid = array.length / 2
    end
    merge(merge_sort(array[0..mid]), merge_sort(array[mid+1..-1]))
end

def merge(array_1, array_2)
    res = []
    while array_1.length > 0 && array_2.length > 0
        if array_1.first <= array_2.first
            res << array_1.first
            array_1.shift
        else
            res << array_2.first
            array_2.shift
        end
    end
    if array_1.empty?
        res += array_2
    else
        res += array_1
    end

    res 
end

# p merge_sort([1,12,3,10])
# p merge_sort([3,1])
# p merge_sort([1])
# p merge_sort([1,12,33, 10])


# Array Subsets
# Write a method subsets that will return all subsets of an array.

def subsets(array)
    return [array] if array.empty?
    res = subsets(array[0...-1]).dup
    res.each {|ele| ele << array[-1]}
    subsets(array[0...-1]) + res
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# You can implement this as an Array method if you prefer.

# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:

# Those that do not contain 3 (all of these are subsets of [1, 2]).
# For every subset that does not contain 3, there is also a corresponding subset that is the same, except it also does contain 3.



# Permutations
# Write a recursive method permutations(array) that calculates all the permutations of the given array. For an array of length n there are n! different permutations. So for an array with three elements we will have 3 * 2 * 1 = 6 different permutations.

def permutations(array)
    return [array] if array.length <= 1
    res = []
    prev_perms = permutations(array[0...-1])
    prev_perms.each do |perm|
        (0..perm.length).each do |i|
            res << perm[0...i] + [array[-1]] + perm[i..-1]
        end
    end
    res  
end

def permutations(array)
    return [array] if array.length == 1
    res = []
    prev_perms = permutations(array[0...-1])
    prev_perms.each do |perm|
        perm << array[-1]
        res << perm
        i = perm.length - 1
        while i > 0
            perm[i], perm[i-1] = perm[i-1], perm[i]
            res << perm
            i -= 1
        end
    end
    res  
end

# p permutations([1]) # => [[1]]
# p permutations([1, 2]) # => [[1,2], [2,1]]
# p permutations([1, 2, 3]) # => [[1, 2, 3], [1, 3, 2],
                        #     [2, 1, 3], [2, 3, 1],
                        #     [3, 1, 2], [3, 2, 1]]
# You can use Ruby's built in Array#permutation method to get a better understanding of what you will be building.

# [1, 2, 3].permutation.to_a  # => [[1, 2, 3], [1, 3, 2],
#                             #     [2, 1, 3], [2, 3, 1],
#                             #     [3, 1, 2], [3, 2, 1]]



# Make Change
# RubyQuiz: Make change.

# Here's a game plan for solving the problem:

# First, write a 'greedy' version called greedy_make_change:

# Take as many of the biggest coin as possible and add them to your result.
# Add to the result by recursively calling your method on the remaining amount, leaving out the biggest coin, until the remainder is zero.
# Once you have a working greedy version, talk with your partner about refactoring this to make_better_change. What's wrong with greedy_make_change?

# Consider the case of greedy_make_change(24, [10,7,1]). Because it takes as many 10 pieces as possible, greedy_make_change misses the correct answer of [10,7,7] (try it in pry).

# To make_better_change, we only take one coin at a time and never rule out denominations that we've already used. This allows each coin to be available each time we get a new remainder. By iterating over the denominations and continuing to search for the best change, we assure that we test for 'non-greedy' uses of each denomination.

# Discuss the following game plan and then work together to implement your new method:

# Iterate over each coin.
# Grab only one of that one coin and recursively call make_better_change on the remainder using coins less than or equal to the current coin.
# Add the single coin to the change returned by the recursive call. This will be a possible solution, but maybe not the best one.
# Keep track of the best solution and return it at the end.
# N.B. Don't generate every possible permutation of coins and then compare them. Remember that a permutation is not the same thing as a combination - we will need to check every combination of coins that add up to our target, we just don't want to check the same combination in different orders. If you get stuck you can start by writing a solution that calculates and compares all of the permutations without storing them in an array. Then go back and refactor your solution so that it only calculates and compares all of the different combinations. If you and your partner get totally stuck, or would like to compare your answer, feel free to reference this video walkthrough of the problem.

# Make sure you and your partner understand each line before moving on.

# def greedy_make_change(amount, changes)
#     changes.sort!.reverse!
#     res = []
#     changes.each do |change|
#         while amount >= change
#             res << change
#             amount -= change
#         end
#     end
#     res
# end

def greedy_make_change_worker(amount, changes)
    return [] if amount == 0
    coin = changes.first
    if amount >= coin
        return greedy_make_change_worker(amount - coin, changes).unshift(coin)
    else
        changes.shift
        return greedy_make_change_worker(amount, changes) 
    end

end

def greedy_make_change_main(amount, changes)
    changes.sort!.reverse!
    greedy_make_change_worker(amount, changes)
end


# p greedy_make_change_main(24, [10,7,1]) # => [10,10,1,1,1,1]

def make_better_change(amount, changes)
    return [] if amount == 0
    best_change = nil
    changes.each do |coin|
        next if amount < coin
        change = [coin] + make_better_change(amount - coin, changes)
        if best_change == nil || best_change.length > change.length
            best_change = change
        end
    end
    best_change   
end  

p make_better_change(24, [10,7,1]) # => [10,7,7]


# Problem 1: You have array of integers. Write a recursive solution to find the sum of the integers.

def sum(array)
    return array.first if array.length <= 1
    array.first + sum(array[1..-1])
end

# p sum([1,2,3])
# p sum([4,2,3])

# Problem 2: You have array of integers. Write a recursive solution to determine whether or not the array contains a specific value.

def inclusive?(array, num)
    return false if array.empty?
    return array.first == num  || inclusive?(array[1..-1], num)
end

def inclusive?(array, num)
    return false if array.empty?
    mid = array.length / 2 
    return array[mid] == num || inclusive?(array[0...mid], num) || inclusive?(array[mid+1..-1], num)
end

def inclusive?(array, left, right, num)
    return false if right < left
    mid = (left + right) / 2 
    return array[mid] == num || inclusive?(array, left, mid-1, num) || inclusive?(array, mid+1, right, num)
end

# p inclusive?([1, 2, 3], 0, 2, 0)
# p inclusive?([23, 4, 5, 1], 0, 3, 1)
# p inclusive?([1], 0, 3, 1)
# p inclusive?([], 0, 3, 1)

# Problem 3: You have an unsorted array of integers. Write a recursive solution to count the number of occurrences of a specific value.

def count_occurrences(array, num)
    return 0 if array.empty?
    counter = 0
    counter += 1 if array.first == num
    count_occurrences(array[1..-1], num)
    counter
end

# p count_occurrences([1,1,2,3], 1)
# p count_occurrences([], 1)
# p count_occurrences([2,3], 1)
# p count_occurrences([1,4,2,3], 1)


# Problem 4: You have array of integers. Write a recursive solution to determine whether or not two adjacent elements of the array add to 12.

def  adjacent_elements(array)
    return false if array.length <= 1
    array[0] + array[1] == 12 || adjacent_elements(array[1...-1])
end

# p adjacent_elements([1,11,2,3])
# p adjacent_elements([1,10,2,3])
# p adjacent_elements([])
# p adjacent_elements([2])


# Problem 5: You have array of integers. Write a recursive solution to determine if the array is sorted.

def sorted?(array)
    return true if array.length == 1
    return false if array.empty? || array[0] > array[1]
    sorted?(array[1..-1])
end

# p sorted?([1,2,3])
# p sorted?([1])
# p sorted?([])
# p sorted?([12,2,3])