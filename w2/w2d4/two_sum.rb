def bad_two_sum?(arr, target_sum) # n ^ 2
  (0...arr.length).each do |idx1|
    (0...arr.length).each do |idx2|
      unless idx1 == idx2
        return true if arr[idx1] + arr[idx2] == target_sum
      end
    end
  end
  false
end

def okay_two_sum?(arr, target_sum) # n^2
  sorted_arr = arr.sort
  idx1 = 0
  (0...arr.length).each do |i|
    return false if sorted_arr[i] > target_sum
    (i+1...sorted_arr.length).each do |j|
      break if sorted_arr[i] + sorted_arr[j] > target_sum || sorted_arr[j] > target_sum
      return true if sorted_arr[i] + sorted_arr[j] == target_sum && i != j
    end
  end
  false
end

def more_okay_two_sum?(arr, target_sum) # n log n?
  sorted_arr = arr.sort
  i = 0
  while i < arr.length && sorted_arr[i] < target_sum
    search_target = target_sum - sorted_arr[i]
    return true unless bsearch(sorted_arr, search_target).nil?
    i += 1
  end
  false
end

def bsearch(nums, target)
  return nil if nums.count == 0

  probe_index = nums.length / 2
  case target <=> nums[probe_index]
  when -1

    bsearch(nums.take(probe_index), target)
  when 0
    probe_index
  when 1
    sub_answer = bsearch(nums.drop(probe_index + 1), target)
    (sub_answer.nil?) ? nil : (probe_index + 1) + sub_answer
  end
end

def pair_sum?(nums, target) # O(n)
  numshash = Hash.new(0)
  nums.each do |num|
    numshash[num] += 1
  end

  nums.each do |num|
    hash_target = target - num
    if num == hash_target
      return true if numshash[hash_target] > 1
    else
      return true if numshash[hash_target] > 0
    end
  end
  false
end

if __FILE__ == $PROGRAM_NAME
  # arr = [0, 1, 2, 3, 4, 5, 9].reverse
  # arr = (0..100).to_a.reverse
  arr = []
  500.times {arr << rand(2) }
  start = Time.now
  val1 = bad_two_sum?(arr, 21)
  puts "bad_two_sum?\t #{Time.new - start} seconds"
  puts "Value: #{val1}"

  start = Time.now
  val2 = okay_two_sum?(arr, 21)
  puts "okay_two_sum?\t #{Time.new - start} seconds"
  puts "Value: #{val2}"

  start = Time.now
  val2 = more_okay_two_sum?(arr, 21)
  puts "more_okay_two_sum?\t #{Time.new - start} seconds"
  puts "Value: #{val2}"

  start = Time.now
  val2 = pair_sum?(arr, 21)
  puts "pair_sum?\t #{Time.new - start} seconds"
  puts "Value: #{val2}"
end
