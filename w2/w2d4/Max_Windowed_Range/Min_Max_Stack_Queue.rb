require_relative 'Min_Max_Hashable'
require_relative 'My_Stack'
require_relative 'Stack_Queue'
require_relative 'Min_Max_Stack'

class MinMaxStackQueue < StackQueue
  attr_reader :max, :min

  def initialize
    super
    @in = MinMaxStack.new
    @out = MinMaxStack.new
  end

  def min
    if !@out.min.nil? && !@in.min.nil?
      if @out.min < @in.min
        @out.min 
      else
        @in.min 
      end
    elsif @out.min.nil?
      @in.min
    elsif @in.min.nil?
      @out.min 
    else
      nil
    end
  end

  def max
    if !@out.max.nil? && !@in.max.nil?
      if @out.max < @in.max
        @out.max 
      else
        @in.max 
      end
    elsif @out.max.nil?
      @in.max
    elsif @in.max.nil?
      @out.max 
    else
      nil
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  arr = [0, 4, 7, 3, 5, 2, 4]
  ms = MinMaxStackQueue.new

  arr.each do |elem|
    ms.enqueue(elem)
  end

  until ms.size == 0
    p ms.max == arr.max
    p ms.min == arr.min
    arr.shift
    ms.dequeue
  end
end
