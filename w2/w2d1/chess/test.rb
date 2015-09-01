require_relative 'board'
require_relative 'piece_manifest'

b = Board.new
# rook = Rook.new(    b, [2,2], :black)
# bishop = Bishop.new(b, [0,3], :white)
# king = King.new(    b, [0,0], :black)
# knight = Knight.new(b, [0,1], :white)
# queen  = Queen.new( b, [0,4], :black)
# b[0,1] = knight
# # b[0,0] = king
r = b[0,0]
t = b.in_bounds?([0,0])
# p "Rook:   #{r.valid_moves}, True?: #{t}"
# p "Knight: #{knight.valid_moves}"
# p "Rook:   #{knight.]valid_moves}"
# p "Bishop: #{knight.valid_moves}"
# p "Queen:  #{knight.valid_moves}"


# p b.grid
