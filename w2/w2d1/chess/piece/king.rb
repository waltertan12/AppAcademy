require_relative '../piece'
require_relative 'modules'

class King < Piece
  include Steppable

  MOVES = [
    [ 1, 0],
    [ 1, 1],
    [ 1,-1],
    [ 0,-1],
    [-1,-1],
    [-1, 0],
    [-1, 1],
    [ 0, 1]
  ]

  def to_s
    "K"
  end

  def valid_moves
    possible_moves(DIRECTIONS[:king])
  end

end
