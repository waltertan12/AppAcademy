#Problem 1: You have array of integers. Write a recursive solution to find the
#sum of the integers.

def sum_recur(array)
  if array.length == 1
    return array[0]
  end
  sum_recur(array.drop(1)) + array[0]
end

#Problem 2: You have array of integers. Write a recursive solution to determine
#whether or not the array contains a specific value.

def includes?(array, target)
  return array[0] == target if array.length == 1
  (array[0] == target) || includes?(array.drop(1), target)
end

# Problem 3: You have an unsorted array of integers. Write a recursive solution
# to count the number of occurrences of a specific value.

def num_occur(array, target)
  return 1 if array[0] == target && array.length == 1
  return 0 if array[0] != target && array.length == 1
  num_occur(array.drop(1), target) + num_occur(array.take(1), target)
end

# Problem 4: You have array of integers. Write a recursive solution to determine
# whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
  return false if array.length < 2
  if array[0] + array[1] == 12
    return true
  else
    add_to_twelve?(array.drop(1))
  end
end

# Problem 5: You have array of integers. Write a recursive solution to determine
# if the array is sorted.

def sorted?(array)
  return false if array[0] > array[1]
  return true if array.length <= 2
  if array[0] < array[1]
    sorted?(array.drop(1))
  end
end

# Problem 6: Write a recursive function to reverse a string. Don't use any
# built-in #reverse methods!

def reverse(string)
  return string if string.length == 1
  reversed = ""
  string[-1] + reverse(string[0..-2])
end
