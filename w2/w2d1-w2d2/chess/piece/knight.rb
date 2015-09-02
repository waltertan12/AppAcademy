require_relative '../piece'
require_relative 'modules'
class Knight < Piece
  include Steppable

  def to_s
    "k"
  end

  def all_moves
    steppable_moves(DIRECTIONS[:knight])
  end
end
