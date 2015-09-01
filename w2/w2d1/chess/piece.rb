class Piece
  attr_reader :color, :board
  attr_accessor :position

  def initialize(board, position, color)
    @board = board
    @position = position
    @color = color
  end

  def possible_moves
    []
  end

  # def add_valid_move()
  #   board[*pos].color != self.color
  # end

  def occupied?
    true
  end


end
