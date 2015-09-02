module Cursorable

  KEYMAP = {
    " " => :space,
    "a" => :left,
    "s" => :down,
    "w" => :up,
    "d" => :right,
    "\r" => :return,
    "\u0003" => :ctrl_c,
  }

  MOVES = {
    left: [0, -1],
    right: [0, 1],
    up: [-1, 0],
    down: [1, 0]
  }

  def get_input
    input = nil
    while KEYMAP[input].nil?
      input = gets.chomp[0]
    end
    MOVES[KEYMAP[input]]
  end

  def move
    update_cursor(get_input)
  end

  def update_cursor(delta)
    if valid_cursor_move?(delta)
      @cursor = [@cursor.first + delta.first, @cursor.last + delta.last]
    end
  end

  def valid_cursor_move?(delta)
    raise "no @cursor" if @cursor.nil?
    x, y = @cursor.first + delta.first, @cursor.last + delta.last
    (0..7).include?(x) && (0..7).include?(y)
  end
end
