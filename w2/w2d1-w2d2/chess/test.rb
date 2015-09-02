require_relative 'board'
require_relative 'piece_manifest'
require_relative 'display'

b = Board.new


rook = b[0,0]
bishop = b[0,5]
pawn = b.find_piece([1,0])

queen = b.find_piece([0,3])
d = Display.new(b)

b.move(queen, [3,4])
b.move(bishop, [3,0])
b.move(rook, [6,0])

king_pos = b.find_king_position(:white)
king = b.find_piece(king_pos)
p b.checkmate?(:white)

# p "Legal: #{pawn.legal_moves}"
# p "All:   #{pawn.all_moves}"
p "Legal: #{king.legal_moves}"
p "All:   #{king.all_moves}"
# p
d.render
