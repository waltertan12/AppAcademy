def my_min_i(arr)
  (0...arr.length).each do |i|
    larger = true
    (0...arr.length).each do |j|
      larger = false if arr[i] > arr[j] && i != j
      # return[i]
    end
    return arr[i] if larger
  end
end

def my_min_ia(arr) #time complexity is n^2
  (0...arr.length).each do |i|
    (0...arr.length).each do |j|
      break if arr[i] > arr[j] && i != j
      return arr[i] if j == arr.length - 1
    end
  end
end



def my_min_ii(arr) #time complexity is n
  min = arr[0]
  (1...arr.length).each do |i|
    min = arr[i] if arr[i] < min
  end
  min
end



def contig_sum_i(arr) # time complexity is n^2
  subs = []
  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      subs << arr[i..j]
    end
  end
maxsub = subs[0].reduce(:+)
  subs.drop(1).each do |subsum|
    if subsum.reduce(:+) > maxsub
      maxsub = subsum.reduce(:+)
    end
  end
  maxsub
end



def contig_sum_ii(arr)  # time complexity is n ^____^
  current_sum = arr[0]
  max_sum = arr[0]
  (1...arr.length).each do |i|
    current_sum += arr[i]
    current_sum = arr[i] if current_sum < 0
    max_sum = current_sum if current_sum > max_sum
  end
  max_sum
end
