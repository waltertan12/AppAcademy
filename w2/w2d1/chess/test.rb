require_relative 'board'
require_relative 'piece_manifest'

b = Board.new
# b[2,2] = Rook.new(b, [2,2], :black)
# b[0,3] = Bishop.new(b, [0,3], :white)
# king = King.new(b, [0,0], :black)
# knight = Knight.new(b, [0,1], :white)
# b[0,1] = knight
# # b[0,0] = king
# p "King: #{king.valid_moves}"
# p "Knight: #{knight.valid_moves}"


p b.grid
