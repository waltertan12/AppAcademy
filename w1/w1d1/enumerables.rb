class Array
  def my_each(&blk)
    0.upto(self.length - 1) do |idx|
      blk.call(self[idx])
    end
    self
  end

  def my_select
    result = []
    self.my_each do |elem|
      result << elem if yield(elem)
    end
    result
  end

  def my_reject
    result = []
    self.my_each do |elem|
      result << elem unless yield(elem)
    end
    result
  end

  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_all?
    self.my_each do |elem|
      return false unless yield(elem)
    end
    true
  end

  def my_flatten
    result = []
    self.my_each do |elem|
      if elem.is_a?(Array)
        result += elem.my_flatten
      else
        result << elem
      end
    end
    result
  end

  def my_zip(*arg)
    array = Array.new(self.length)
    idx1 = 0

    while idx1 < self.length
      temp = [self[idx1]]
      # temp << self[idx1]

      idx2 = 0
      while idx2 < arg.length
        temp << arg[idx2][idx1]
        idx2 += 1
      end
      array[idx1] = temp
      idx1 += 1
    end

    array
  end

  def my_rotate(r=1)
    result = []
    r = (self.length + r) if r < 0
    r = r % self.length if r > self.length

    for i in 0...self.length
      if i + r < self.length
        result << self[i + r]
      else
        result << self[i + r - self.length]
      end
    end

    result #[r...(r+self.length)]
  end

  def my_join(separator = "")
    result = self[0]
    for i in 1...self.length
    # self.length.times do |i|
    # (1...self.length).each do |i|
      result += separator + self[i]
    end
    result
  end

  def my_reverse
    result = []
    (self.length-1).downto(0) {|idx| result << self[idx]}
    result
  end

end
