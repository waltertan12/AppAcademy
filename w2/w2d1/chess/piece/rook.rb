require_relative '../piece'
require_relative 'modules'

class Rook < Piece
  include Slideable

  def valid_moves
    possible_moves(DIRECTIONS[:vertical] + DIRECTIONS[:horizontal])
  end

  def to_s
    "R"
  end

  def inspect
    "ROOK"
  end
end
