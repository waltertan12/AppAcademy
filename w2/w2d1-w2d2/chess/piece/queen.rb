require_relative '../piece'
require_relative 'modules'

class Queen < Piece
  include Slideable

  def to_s
    "Q"
  end

  def all_moves
    slideable_moves(DIRECTIONS[:diagonal] +
                    DIRECTIONS[:vertical] +
                    DIRECTIONS[:horizontal])
  end
end
