require_relative 'piece_manifest'

class Board
  # PIECE_POSITIONS = {
  #   :rook   => [[0, 0], [0, 7], [7, 0], [7, 7]]
  #   :knight => [],
  #   :bishop =. []
  # }
  PIECES = [Rook.new(self, [0,0], :black), Rook.new(self, [0,7], :black),
            Rook.new(self, [7,0], :white), Rook.new(self, [7,7], :white),
            Knight.new(self, [0,1], :black), Knight.new(self, [0,6], :black),
            Knight.new(self, [7,1], :white), Knight.new(self, [7,6], :white),
            Bishop.new(self, [0,2], :black), Bishop.new(self, [0,5], :black),
            Bishop.new(self, [7,2], :white), Bishop.new(self, [7,5], :white),
            Queen.new(self, [0,3], :black), Queen.new(self, [7,3], :white),
            King.new(self, [0,4], :black), King.new(self, [7,4], :white)]
            # Rook.new(board, [0,0], :black), Rook.new(board, [0,0], :black)
            # Rook.new(board, [0,0], :black), Rook.new(board, [0,0], :black)

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    populate
  end

  def generate_empty_board
    (0..7).each do |x|
      (0..7).each do |y|
        self[x, y] = EmptyPiece.new(self, [x, y])
      end
    end
  end

  def populate
    generate_empty_board
    PIECES.each do |piece|
      add_piece(piece)
    end
  end

  def move(start_pos, end_pos)
    piece = find_piece(start_pos)
    if piece.valid_move?(end_pos)
      grid[*end_pos] = grid[*start_pos]
      grid[*start_pos] = "tile" #empty tile
    else
      raise "oopss"
    end
  end

  def [](x, y)
    @grid[x][y]
  end

  def []=(x, y, val)
    @grid[x][y] = val
  end

  def in_bounds?(pos)
    (0..7).include?(pos.first) && (0..7).include?(pos.last)
  end

  def find_piece(pos)
    raise "no piece" if #no piece
    grid[*pos]
  end

  private

  def add_piece(piece)
    pos = piece.position
    self[*pos] = piece
  end

  def remove_piece(piece)
    pos = piece.position
    self[*pos] = EmptyPiece.new(self, pos)
  end


end
