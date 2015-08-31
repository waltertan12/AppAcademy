require 'byebug'
require 'colorize'

def range(start, finish)
  return [] if start > finish
  [start] + range(start + 1, finish)
end

def sum(array)
  return array.first if array.length == 1
  array.first + sum(array.drop(1))
end

def exp_one(b, n)
  return 1 if n.zero?
  b * exp_one(b, n - 1)
end

def exp_two(b, n)
  return 1 if n.zero?
  return b if n == 1
  if n.even?
    value = exp_two(b, n / 2)
    value * value
  else
    value = exp_two(b, (n-1) / 2)
    b * value * value
  end
end

class Array
  def deep_dup
    duped = []
    self.each do |elem|
      if elem.is_a?(Array)
        duped << elem.deep_dup
      else
        duped << elem
      end
    end
    duped
  end
end

def fibonacci(num)
  return [0]       if num == 1
  return [0, 1]    if num == 2
  return [0, 1, 1] if num == 3
  fib = fibonacci(num - 1)
  fib << fib[-2] + fib[-1]
end

def bsearch(array, target)
  if array.length == 1
    return nil unless target == array.first
    return 0
  end

  midpoint = array.length / 2
  left, right = array.take(midpoint), array.drop(midpoint)

  case target <=> array[midpoint]
    when -1
      bsearch(left, target)
    when  0
      midpoint
    when  1
      index = bsearch(right, target)
      if index.nil?
        nil
      else
        midpoint + index
      end
  end
end

def make_change(target, coins = [25, 10, 5, 1])
  return [] if target == 0 || coins.empty?
  coins.sort!.reverse!
  best_change = nil
  coins.each_with_index do |coin, index|
    next if coin > target

    rem = target - coin

    best_remainder = make_change(rem, coins.drop(index))

    next if best_remainder.nil?

    this_change = [coin] + best_remainder

    if (best_change.nil? || this_change.count < best_change.count)
      best_change = this_change
    end
  end

  best_change
end

def merge_sort(array, &prc)
  prc ||= Proc.new {|x,y| x <=> y}

  return array if array.length <= 1

  midpoint = array.length / 2
  left, right = array.take(midpoint), array.drop(midpoint)

  merge(merge_sort(left, &prc), merge_sort(right, &prc), &prc)
end

def merge(left, right, &prc)
  sorted = []
  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when -1
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted + left + right
end

def subsets(array)
  return [[]] if array.empty?
  sets = subsets(array.take(array.length - 1))
  sets += sets.map do |elem|
    elem.dup << array.last
  end
end


if __FILE__ == $PROGRAM_NAME
  system("clear")
  # Test Range
  puts "Recursion#Range".colorize(:red)
  puts range(0, 5) == [0, 1, 2, 3, 4, 5]
  puts range(4, 3) == []

  puts "Recursion#Sum".colorize(:red)
  puts sum([0,1,2,3])  == 6
  puts sum([93, -6])   == 87

  puts "Recursion#Exp_One".colorize(:red)
  puts exp_one(2,2) == 2 ** 2
  puts exp_one(2,3) == 2 ** 3
  puts exp_one(2,4) == 2 ** 4
  puts exp_one(2,9) == 2 ** 9

  puts "Recursion#Exp_Two".colorize(:red)
  puts exp_two(2,2) == 2 ** 2
  puts exp_two(2,3) == 2 ** 3
  puts exp_two(2,4) == 2 ** 4
  puts exp_two(2,9) == 2 ** 9

  puts "Recursion#Deep_dup".colorize(:red)
  a = [0,1,2,3,4,[0,1,2,3],[0,[2,4]]]
  b = a.deep_dup
  c = a.dup
  puts a == b
  puts a.object_id != b.object_id
  puts a.object_id != c.object_id
  puts a[5].object_id != b[5].object_id
  puts a[5].object_id == c[5].object_id

  puts "Recursion#Fibonacci".colorize(:red)
  puts fibonacci(1) == [0]
  puts fibonacci(2) == [0, 1]
  puts fibonacci(3) == [0, 1, 1]
  puts fibonacci(4) == [0, 1, 1, 2]
  puts fibonacci(5) == [0, 1, 1, 2, 3]
  puts fibonacci(6) == [0, 1, 1, 2, 3, 5]

  puts "Recursion#Binary_Search".colorize(:red)
  a = (0...9).map { |num| num*2 }
  puts bsearch(a,  2) == 1
  puts bsearch(a,  6) == 3
  puts bsearch(a, 16) == 8
  puts bsearch(a, 10) == 5
  puts bsearch(a, 13).nil?

  puts "Recursion#Make_Change".colorize(:red)
  puts make_change(25)            == [25]
  puts make_change(26)            == [25, 1]
  puts make_change(14,[10, 7, 1]) == [7, 7]

  puts "Recursion#Merge_Sort".colorize(:red)
  a = [  9,  4,  7,  3,  6,  1]
  b = ["A","c","Z","?"]
  c = [  1,  2,  3,  4]
  d = Proc.new { |x, y| y <=> x }
  puts merge_sort(a)       == a.sort
  puts merge_sort(b)       == b.sort
  puts merge_sort(c, &d)   == c.sort.reverse

  puts "Recursion#Subsets".colorize(:red)
  puts subsets([])        == [[]]
  puts subsets([1])       == [[], [1]]
  puts subsets([1, 2])    == [[], [1], [2], [1,2]]
  puts subsets([1, 2, 3]) == [[], [1], [2], [1,2], [3], [1, 3], [2, 3], [1, 2, 3]]
end