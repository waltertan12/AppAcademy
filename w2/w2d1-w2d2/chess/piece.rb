class Piece
  attr_reader :color, :board
  attr_accessor :position

  def initialize(board, position, color)
    @board = board
    @position = position
    @color = color
  end

  def is_king?
    false
  end

  def legal_moves
    self.all_moves.reject do |new_pos|
      board_copy = board.dup
      piece_copy = board_copy.find_piece(self.position)
      board_copy.move!(piece_copy, new_pos)
      board_copy.in_check?(piece_copy.color)
    end
  end

  def update_position(pos)
    @position = pos
  end


  def occupied?
    true
  end

  def dup(new_board)
    # new_board = board.dup
    self.class.new(new_board, self.position, self.color)
  end

  def inspect
    "#{self.to_s}: #{self.object_id}, Board: #{board.object_id}, Color: #{self.color}, Position #{self.position}"
  end
end
