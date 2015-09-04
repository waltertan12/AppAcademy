require_relative 'My_Stack'
require_relative 'Min_Max_Hashable'

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