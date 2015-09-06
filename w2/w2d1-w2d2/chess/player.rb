class HumanPlayer
  attr_reader :color

  def initialize(color, board)
    @color = color
    @board = board
  end

  def get_input(display)
    display.get_input
  end
end

class ComputerPlayer
  attr_reader :color, :board, :level

  Points = {
    EmptyPiece  =>  0,
    Pawn   =>  1,
    Bishop =>  3,
    Knight =>  5,
    Rook   =>  7,
    Queen  =>  9,
    King   => 13
  }

  def initialize(color, board, level = 5)
    @color = color
    @opposing_color = (color == :black ? :white : :black)
    @board = board
    @level = level
    @piece_to_move = nil
    @next_move = nil
  end

  def get_input(display)
    # coords = select_random
    if @piece_to_move.nil?
      piece_and_move = select_smart
      @piece_to_move = piece_and_move.first
      @next_move     = piece_and_move.last
      coords         = @piece_to_move.position
    else
      coords = @next_move
      @next_move, @piece_to_move = nil, nil
    end
    coords
  end

  def select_random
    if @piece_to_move.nil?
      @piece_to_move = my_pieces(board).sample
      # sleep(0.025)
      coords = @piece_to_move.position
    else
      # sleep(0.025)
      king_position = board.find_king_position(@opposing_color)
      if @piece_to_move.legal_moves.include?(king_position)
        coords = king_position
      else
        coords = @piece_to_move.legal_moves.sample
      end
      @piece_to_move = nil
    end
    coords
  end

  def select_smart
    max_score = 0
    pieces_and_moves = []
    piece_to_move, coords = nil, nil
    my_pieces(board).each do |piece|
      piece.legal_moves.each do |move|
        # duped_board = board.dup
        # tile = duped_board[*move]
        tile = board[*move]
        if take_piece?(tile)
          puts "TAke piece"
          if Points[tile.class] > max_score
            max_score = Points[tile.class]
            piece_to_move = piece
            coords        = move
            puts "POINTS: #{Points[tile.class]}, max: #{max_score}, piece: #{piece_to_move}, move: #{coords}"
          end
        else
          pieces_and_moves << [piece, move]
        end
        # duped_board.move(piece, move)
      end
    end
    piece_to_move, coords = pieces_and_moves.sample if max_score == 0
    puts "max: #{max_score}, piece: #{piece_to_move}, move: #{coords}"
    [piece_to_move, coords]
  end

  def take_piece?(tile)
    tile.occupied? && tile.color == @opposing_color
  end

  # def move_smart
    
  # end

  # def map_moves
    # duped_board = board.dup

    # queue = [duped_board]
    # iterations = 0

    # moves = []

    # until iterations == level * 10
    #   board = queue.shift.dup
    #   p board
    #   iterations += 1
    #   check_move(board, moves)
    #   moves.each do |move|
    #     queue << move[:board]
    #   end
    #   # queue << moves.last[:board]
    # end
  # end

  # def check_move(board, moves_array)
  #   my_pieces(board).each do |piece|
  #     piece.legal_moves.each do |move|
  #       move_hash = perform_move(board, piece, move, color)
  #       moves_array << move_hash
  #     end
  #   end
  # end

  # def perform_move(board, piece, move_pos, color)
  #   tile = board[*move_pos]
  #   if tile.occupied?
  #     if tile.color != color
  #       points_difference = points[tile.class]
  #     elsif tile.color == color
  #       points_difference = -points[tile.class]
  #     end
  #   end
  #   board.move(piece, move_pos)
  #   { points_difference: points_difference, board: board }
  # end

  def my_pieces(board)
    board.all_pieces.select do |piece|
      piece.color == color
    end
  end
end