require_relative '../piece'
class EmptyPiece < Piece

  def initialize(board, pos)
    super(board, pos, :none)
  end

  def valid_moves
    []
  end

  def to_s
    " "
  end

  def occupied?
   false
  end

  def inspect
    "EMPTY"
  end
end
