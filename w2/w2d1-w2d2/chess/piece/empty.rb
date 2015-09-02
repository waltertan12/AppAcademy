require_relative '../piece'
class EmptyPiece < Piece

  def initialize(board, pos, color = :none)
    super(board, pos, color)
  end

  def valid_moves
    []
  end

  def all_moves
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
