require_relative '../piece'
require_relative 'modules'
class Knight < Piece
  include Steppable

  MOVES = [
    [ 2, 1],
    [ 2,-1],
    [-2,-1],
    [-2, 1],
    [ 1, 2],
    [ 1,-2],
    [-1,-2],
    [-1, 2]
  ]

  def to_s
    "k"
  end

  def valid_moves
    possible_moves(DIRECTIONS[:knight])
  end
end
