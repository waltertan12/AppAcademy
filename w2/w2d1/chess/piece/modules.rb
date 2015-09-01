module Steppable
  DIRECTIONS = {
    :knight => [
      [ 2, 1], [ 2,-1], [-2,-1], [-2, 1],
      [ 1, 2], [ 1,-2], [-1,-2], [-1, 2]
    ],
    :king => [
      [ 1, 0], [ 1, 1], [ 1,-1], [ 0,-1],
      [-1,-1], [-1, 0], [-1, 1], [ 0, 1]
    ]
  }

  def possible_moves(move_type)
    moves = []

    move_type.each do |move|
      x, y = self.position
      dx, dy = move
      new_pos = [x + dx, y + dy]
      if board.in_bounds?(new_pos)
        if board[*new_pos].occupied?
          moves << new_pos unless board[*new_pos].color == self.color
        else
          moves << new_pos
        end
      end
    end
    moves
  end
end

module Slideable
  DIRECTIONS = { :vertical => [[0, 1], [0, -1]],
    :horizontal => [[-1, 0],[1, 0]],
    :diagonal => [[1, 1], [1, -1], [-1, 1], [-1, -1]]
  }

  def possible_moves(dir)
    moves = []

    dir.each do |move|
      x, y = self.position
      dx, dy = move
      new_pos = [x + dx, y + dy]
      while board.in_bounds?(new_pos)
        if board[*new_pos].occupied?
          if board[*new_pos].color == self.color
            break
          else
            moves << new_pos
            break
          end
        else
          moves << new_pos
        end
        new_pos = [new_pos.first + dx, new_pos.last + dy]
      end
    end
    moves
  end
end
