require_relative '../piece'
require_relative 'modules'

class King < Piece
  include Steppable

  def to_s
    "K"
  end

  def all_moves
    steppable_moves(DIRECTIONS[:king])
  end

  def is_king?
    true
  end

end
