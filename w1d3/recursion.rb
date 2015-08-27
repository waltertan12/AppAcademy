require 'byebug'

def rec1(b, n)
  return 1 if n == 0
  b * rec1(b, n - 1)
end

def rec2(b, n)
  return 1 if n == 0
  return b if n == 1

  if n.even?
    rec2(b, n/2) * rec2(b, n/2)
  else
    b * (rec2(b, (n-1) / 2) * rec2(b, (n-1) / 2))
  end
end


class Array
  def deep_dup
    deep_arr = []
    self.each do |el|
      if el.is_a?(Array)
        deep_arr << el.deep_dup
      else
        deep_arr << el
      end
    end
    deep_arr
  end
end

def fib(n)
  return [1]    if n == 1
  return [1, 1] if n == 2
  temp = fib(n-1)
  temp << temp[-1] + temp[-2]
end

def fibit(n)
  if n == 1
    results = [1]
  elsif n == 2
    results = [1,1]
  else
    results = [1,1]
    until results.length == n
      results << (results[-1] + results[-2])
    end
  end
  return results
end

def bsearch(array, target)
  idx = array.length / 2

  return idx if array[idx] == target
  return nil if array.length == 1 && array[idx] != target

  if target < array[idx]
    temp = bsearch(array[0...idx], target)
    idx = idx - array[0...idx].length + temp unless temp.nil?
  else
    temp = bsearch(array[idx+1..-1], target)
    idx = idx + array[idx+1..-1].length + temp - 1 unless temp.nil?
  end
end

def mc(amount, coins = [25, 10, 5 ,1])
  return [] if coins.empty? || amount == 0

  while (amount / coins.first == 0)
    coins.shift(1)
  end

  purse = [coins.first]
  purse += mc(amount - coins.first, coins)
end

def mc2(amount, coins = [25, 10, 5, 1])
  # Base case
  return [] if amount == 0 || coins.empty?

  possibilities = []
  coins.each do |coin|
    # Purse for coins
    purse = []
    new_amount = amount
    new_coins = coins.dup

    if amount > coin
      new_amount -= coin
      purse << coin
    else
      new_coins = coins.drop(1)
    end
   # Check remainder
    purse += mc( new_amount, new_coins )

    possibilities << purse
  end

  possibilities.min_by(&:length)
end

def mc3(amount, coins = [25, 10, 5, 1])
  if amount == 0 || coins.empty?
    return []
  end
    purse = []
    num_big = amount/coins.first
    rem = amount % coins.first
    num_big.times { purse << coins.first }
    purse += mc3(rem, coins.drop(1) )


end


def merge_sort(arr)
  return arr if arr.length <= 1

  idx = arr.length / 2
  arr1 = arr.take(idx)
  arr2 = arr.drop(idx)

  merge(merge_sort(arr1), merge_sort(arr2))
end

def merge(arr1,arr2)
  answer = []

  until arr1.empty? || arr2.empty?
    if arr1[0] < arr2[0]
      answer << arr1.shift
    elsif arr2[0] <= arr1[0]
      answer << arr2.shift
    end
  end

  answer += arr1 + arr2
end

def subsets(array)
  return [ array ] if array.empty?
  # answer = [[]]
  new_val = array.pop
  answer = subsets(array)
  p "Answer: #{answer}, Array: #{array}"
  answer += answer.deep_dup.map{|el| el << new_val}

  # subsets(array)
  # subs = subsets(array.drop(1))
  # subs << subsets( array.take(1) )
  # subs << a rray

end
