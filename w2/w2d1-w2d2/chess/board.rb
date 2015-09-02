require_relative 'piece_manifest'

class Board
  attr_accessor :grid

  def initialize(new_game = true)
    @grid = Array.new(8) { Array.new(8) }
    populate if new_game
  end

  def generate_empty_board
    (0..7).each do |x|
      (0..7).each do |y|
        self[x, y] = EmptyPiece.new(self, [x, y])
      end
    end
  end

  def populate
    pieces = [Rook.new(self, [0,0], :black), Rook.new(self, [0,7], :black),
            Rook.new(self, [7,0], :white), Rook.new(self, [7,7], :white),
            Knight.new(self, [0,1], :black), Knight.new(self, [0,6], :black),
            Knight.new(self, [7,1], :white), Knight.new(self, [7,6], :white),
            Bishop.new(self, [0,2], :black), Bishop.new(self, [0,5], :black),
            Bishop.new(self, [7,2], :white), Bishop.new(self, [7,5], :white),
            Queen.new(self, [0,3], :black), Queen.new(self, [7,3], :white),
            King.new(self, [0,4], :black), King.new(self, [7,4], :white),
          ]
    8.times do |num|
      pieces << Pawn.new(self, [1, num], :black)
      pieces << Pawn.new(self, [6, num], :white)
    end

    generate_empty_board
    pieces.each do |piece|
      self[*piece.position] = piece
    end
  end

  def [](x, y)
    @grid[x][y]
  end

  def []=(x, y, val)
    @grid[x][y] = val
  end

  def in_bounds?(pos)
    pos.all? { |coord| (0..7).include?(coord) }
  end

  def find_piece(pos)
    self[*pos]
  end

  def move(piece, end_pos)
    raise MoveError unless piece.legal_moves.include?(end_pos)
    move!(piece, end_pos)
  end

  def move!(piece, end_pos)
    if piece.occupied?
      start_pos = piece.position
      self[*end_pos] = piece
      piece.update_position(end_pos)
      self[*start_pos] = EmptyPiece.new(self, start_pos)
    end
  end

  def dup
    board_copy = Board.new(false)
    grid.each_with_index do |row, row_idx|
      row.each_with_index do |piece, col_idx|
        piece_copy = piece.dup(board_copy)
        board_copy[row_idx, col_idx] = piece_copy
      end
    end
    board_copy
  end

  def in_check?(color)
    king_pos = find_king_position(color)
    all_pieces.any? do |piece|
      piece.color != color && piece.all_moves.include?(king_pos)
    end
  end

  def all_pieces
    grid.flatten
  end

  def checkmate?(color)
    return false unless in_check?(color)
    all_pieces.none? do |piece|
      piece.color == color && !piece.legal_moves.empty?
    end
  end

  def find_king_position(color)
    king = all_pieces.find do |piece|
      piece.is_king? && piece.color == color
    end
    king && king.position
  end
end
