require_relative '../piece'
require_relative 'modules'

class Bishop < Piece
  include Slideable

  def initialize(board, position, color)
    super(board, position, color)
  end

  def to_s
    "B"
  end

  def valid_moves
    possible_moves(DIRECTIONS[:diagonal])
  end
end
