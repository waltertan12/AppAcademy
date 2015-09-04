require_relative 'Min_Max_Stack_Queue'

def naive_max_windowed_range(array, window_size)
  current_max_range = nil
  (0..array.length - window_size).each do |i|
    sub_array = array[i...i + window_size]
    current_window_range = sub_array.max - sub_array.min
    if current_max_range == nil || current_window_range > current_max_range
      current_max_range = current_window_range
    end
  end
  current_max_range
end

def optimized_max_windowed_range(array, window_size)
  current_max_range = nil
  mmsq = MinMaxStackQueue.new

  array.each do |elem|
    mmsq.enqueue(elem)
    mmsq.dequeue if mmsq.size > window_size

    if mmsq.size == window_size
      new_max = mmsq.max - mmsq.min
      current_max_range = new_max if current_max_range.nil? || new_max > current_max_range
    end
  end

  current_max_range
end

def timer(method, times_to_run)
  start = Time.now
  times_to_run.times do |time|
    start_run = Time.now
    method
    puts "Run #{time + 1}:\t#{Time.now - start_run} seconds"
  end
  total_time = Time.now - start
  puts "Average Time:\t#{total_time / times_to_run} seconds"
end

if __FILE__ == $PROGRAM_NAME
  array = Array.new(100000) { rand(100000) }
  puts "Naive Approach:\n"
  timer(naive_max_windowed_range(array, 2), 10)
  puts "Optimized Approach:\n"
  timer(optimized_max_windowed_range(array, 2), 10)
end