module MinMaxHashable

  def record_min_max(el) # called whenever new el pushed / queued
    @max_history.push({ el => @max })
    @min_history.push({ el => @min })
    if @max.nil? || el > @max
      @max = el
    end

    if @min.nil? || el < @min
      @min = el
    end
  end

  def new_max_min(value) # cal when el popped / dequeued
    @max = @max_history.pop[value]
    @min = @min_history.pop[value]
  end

end

def max_windowed_range(array, window_size)
  current_max_range = nil
  (0..array.length - window_size).each do |i|
    sub_array = array[i...i + window_size]
    p sub_array
    current_window_range = sub_array.max - sub_array.min
    if current_max_range == nil || current_window_range > current_max_range
      current_max_range = current_window_range
    end
  end
  current_max_range
end

class MyStack
  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(el)
    @store.push (el)
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def max

  end

  def to_s
    @store.each {|el| print el }
  end
end

class MinMaxStack < MyStack
  include MinMaxHashable

  attr_reader :max, :min
  def initialize
    super
    @max_history = MyStack.new
    @min_history = MyStack.new
    @max = nil
    @min = nil
  end

  def push(el)
    record_min_max(el)
    @store.push(el)
  end

  def pop
    value = @store.pop
    new_max_min(value)
    value
  end
end



class StackQueue
  def initialize
    @in = MyStack.new
    @out = MyStack.new
  end

  def enqueue(el)
    @in.push(el)
  end

  def size
    @in.size + @out.size
  end

  def dequeue
    if @out.size == 0
      until @in.size == 0
        @out.push(@in.pop)
      end
    end
    @out.pop
  end
end



class MinMaxStackQueue < StackQueue

# include MinMaxHashable

attr_reader :max, :min

  def initialize
    super
    @in = MinMaxStack.new
    @out = MinMaxStack.new
  end


  def min
    puts"In Min: #{@in.min}, Out Min: #{@out.min}"
    # return nil if @out.min == nil && @in.min == nil
    # if @out.min == nil || @in.min < @out.min
    #   return @in.min
    # elsif @in.min.nil? || @out.min < @in.min
    #   @out.min
    # end
  end

  def max
    puts "In Max: #{@in.max}, Out Max: #{@out.max}"
    # return nil if @out.max == nil && @in.max == nil
    # if @out.max == nil || @in.max > @out.max
    #   return @in.max
    # elsif @in.max.nil? || @out.max > @in.max
    #   @out.max
    # end
  end

end

if __FILE__ == $PROGRAM_NAME
  # ms = MinMaxStack.new
  # ms.push(8)
  # ms.push(3)
  # ms.push(11)
  # ms.push(11)
  # ms.push(12)
  # puts ms.min
  # ms.pop
  # puts ms.min
  # ms.pop
  # puts ms.min
  # ms.pop
  # puts ms.min
  # ms.pop
  # puts ms.min
  # #
  ms = MinMaxStackQueue.new
  ms.enqueue(1)
  ms.enqueue(2)
  ms.enqueue(10)
  ms.enqueue(3)
  ms.enqueue(11)

  puts "min: #{ms.min}, max: #{ms.max}"
  until ms.size == 0
    puts ms.dequeue
    puts "min: #{ms.min}, max: #{ms.max}"
  end


  # sq = StackQueue.new
  # sq.enqueue(1)
  # sq.enqueue(2)
  # sq.enqueue(10)
  # sq.enqueue(3)
  # sq.enqueue(11)
  #
  # puts sq.dequeue
  # puts sq.dequeue
  # puts sq.dequeue
  # puts sq.dequeue
end
