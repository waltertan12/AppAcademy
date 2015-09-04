require_relative 'My_Stack'

class StackQueue
  def initialize
    @in =  MyStack.new
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