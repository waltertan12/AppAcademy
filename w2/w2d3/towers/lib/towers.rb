class Towers
  attr_reader :stack

  def initialize(stack = [[3, 2, 1], [], []])
    @stack = stack
  end

  def move(pos_one, pos_two)
    if stack[pos_one].empty? ||
      (!stack[pos_two].empty? && (stack[pos_one].last > stack[pos_two].last))
      raise "oh no you can't do that"
    end

    disk = stack[pos_one].pop
    stack[pos_two] << disk
  end

  def won?
    stack[1].count == 3 || stack[2].count == 3
  end

  def render
    p stack
  end

  def [](pos)
    x, y = pos
    stack[x][y]
  end

  def []=(pos, val)
    x, y = pos
    self.stack[x][y] = val
  end

end
