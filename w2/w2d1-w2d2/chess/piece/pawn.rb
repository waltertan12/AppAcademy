class Pawn < Piece
  attr_accessor :moved

  def initialize(board, position, color)
    super(board, position, color)
    @moved = false
  end

  def to_s
    "i"
  end

  def find_direction
    return  1 if color == :black
    return -1 if color == :white
    0
  end

  def move_diffs
    # Add check for moved pawn here
    # Add diagonal check here
    [[find_direction * 2, 0],
      [find_direction, 0],
      [find_direction, 1],
      [find_direction, -1]]
  end

  def update_position(end_pos)
    super(end_pos)
    self.moved = true
  end

  # def can_move_diagonal(delta)
  #   new_pos = get_new_position(delta)
  #   board[*new_pos].occupied? &&
  #   board[*new_pos].color != self.color
  # end

  def get_new_position(delta)
    x, y = position
    dx, dy = delta
    new_pos = [x + dx, y + dy]
  end

  def all_moves
    deltas = move_diffs
    deltas.shift if move_two?
    moves = []

    deltas.each do |delta|
      x, y = position
      dx, dy = delta
      new_pos = [x + dx, y + dy]
      if board.in_bounds?(new_pos)
        # Refactor into helper method for diagonal
        if delta.last != 0 &&
           board[*new_pos].occupied? &&
           board[*new_pos].color != self.color
           then moves << new_pos
        elsif delta.last == 0 &&
              !board[*new_pos].occupied?
              then moves << new_pos
        end
      end
    end
    moves
  end

  def move_two?
    deltas = move_diffs
    x, y = position
    dx, dy = deltas[1]
    moved || board[x + dx, y + dy].occupied?
  end

  def promote?
    (color == :black && position.first == 7) || 
    (color == :white && position.first == 0)
  end
end